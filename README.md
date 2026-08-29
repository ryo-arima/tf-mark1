# tf-mark1

[MiniStack](https://github.com/ministackorg/ministack) provides the local AWS environment for developing Terraform infrastructure as code in this repository.

## Prerequisites

- Docker Engine or Docker Desktop with Docker Compose v2
- Terraform CLI 1.6 or later
- `curl` for health checks
- Host TCP ports `4566` and `8080` available

## Quick start

The default settings work without a `.env` file. Copy the example only when you need to override them.

```sh
cp .env.example .env
```

Start MiniStack, Redis, and [StackPort](https://github.com/DaviReisVieira/stackport), then verify the API and Web UI health endpoints.

```sh
docker compose up -d --wait
curl http://localhost:4566/_ministack/health
curl http://localhost:8080/api/health
```

Open the StackPort resource browser at [http://localhost:8080](http://localhost:8080). It connects only to the MiniStack container and starts in read-only mode.

Initialize Terraform and create the local resources.

```sh
terraform -chdir=terraform init
terraform -chdir=terraform plan -var-file=values/development.tfvars
terraform -chdir=terraform apply -var-file=values/development.tfvars
```

The development values create 19 resources across 15 infrastructure categories. The stack adds two subnets, an application load balancer with an HTTP listener, and a CodeBuild project that consumes a role from the dedicated IAM module. Each AWS provider endpoint is pinned to `localhost:4566`, and the provider uses local `test` credentials, so no real AWS credentials are required.

## Terraform structure

The Terraform configuration separates global settings, environment values, infrastructure abstractions, AWS service resources, entity types, and shared utility processing.

```text
terraform/
|-- entity/
|   |-- module/             # Infrastructure category input types
|   |-- service/            # AWS service input types
|   `-- util/               # Shared context types
|-- global.tf               # Terraform constraints and MiniStack provider
|-- main.tf
|-- modules/
|   |-- analytics/
|   |-- api/
|   |-- cicd/
|   |-- compute/
|   |-- configuration/
|   |-- datastore/
|   |-- dns/
|   |-- event/
|   |-- iam/
|   |-- loadbalancer/
|   |-- messaging/
|   |-- monitor/
|   |-- network/
|   |-- registry/
|   `-- security/
|-- templates/
|   |-- services/
|   |   |-- apigatewayv2/   # AWS service resource definition
|   |   |-- cloudwatch_logs/
|   |   |-- codebuild/
|   |   |-- dynamodb/
|   |   |-- ecr/
|   |   |-- ecs/
|   |   |-- elbv2/
|   |   |-- eventbridge/
|   |   |-- glue/
|   |   |-- iam/
|   |   |-- kms/
|   |   |-- route53/
|   |   |-- sqs/
|   |   |-- ssm/
|   |   `-- vpc/
|   `-- utils/
|       `-- naming.tf
`-- values/
    |-- base.tf             # Environment composition entry point
    |-- development.tfvars  # Local development parameters
    `-- share.tf            # Context shared by concept modules
```

The dependency flow is:

```text
root -> values -> modules -> templates/services
          |                   |
          |                   `-> entity/service
          |-> templates/utils
          `-> entity/module and entity/util
```

- `values/` owns environment parameters and calls infrastructure abstraction modules.
- `values/share.tf` defines the normalized naming and tagging context passed to every concept module.
- `entity/` centralizes strict Terraform object types and validation at module, service, and utility boundaries.
- `modules/` exposes infrastructure concepts such as datastore, load balancer, event, CI/CD, IAM, monitor, network, and security. Concept modules remain thin and contain no AWS resources or service validation modules.
- `modules/iam` maps one-to-one to `templates/services/iam`; dependent modules consume its outputs instead of calling the IAM service directly.
- [terraform/modules/README.md](terraform/modules/README.md) assigns supported AWS service families to module categories and identifies each default representative.
- `templates/services/<aws-service>/base.tf` validates service parameters through `entity/service/` and defines the AWS resources for one service.
- AWS service directories exist only under `templates/services/`; do not add service directories directly under `templates/`.
- `templates/utils/` contains reusable or miscellaneous Terraform processing that is not owned by one AWS service.
- The root `main.tf` delegates composition to `values/` and does not define AWS resources directly.

`terraform/global.tf` is the single source for Terraform version constraints, AWS provider requirements, local credentials, and MiniStack endpoints. The default AWS provider is inherited through the local module tree, so module calls must not repeat `providers = { aws = aws }`. Add an explicit provider mapping only when an aliased provider configuration is introduced.

Cross-module dependencies are connected only by the values layer:

- `network.subnet_ids` is passed to `loadbalancer`; the load balancer module does not create network resources.
- `iam.role_arn` is passed to `cicd`; the CI/CD module does not create IAM resources or call the IAM service template.

This keeps each concept independently reusable while preserving explicit dependency direction.

To add an infrastructure concept, define its values schema under `entity/module/`, create a thin orchestration module under `modules/`, define the service type under `entity/service/`, validate it from `templates/services/<aws-service>/base.tf`, and call the concept module from `values/base.tf`.

## Common commands

```sh
make up                # Start the local development services
make health            # Check MiniStack health
make stackport-health  # Check StackPort health
make logs              # Follow MiniStack logs
make tf-init           # Initialize Terraform
make tf-fmt            # Format Terraform files
make tf-validate       # Validate the Terraform configuration
make tf-plan           # Show the execution plan
make tf-apply          # Create or update local resources
make tf-destroy        # Delete local resources
make down              # Stop containers and preserve persistent data
```

Terraform commands use `terraform/values/development.tfvars` by default. Select another values file with `TF_VALUES_FILE`, using a path relative to `terraform/`.

```sh
make tf-plan TF_VALUES_FILE=values/example.tfvars
```

MiniStack state, S3 objects, and StackPort settings are persisted in Docker volumes. To remove them completely, first confirm that the Terraform-managed resources are no longer needed, then run:

```sh
docker compose down -v
```

Use `make reset` to reset only the MiniStack API state.

## Configuration

Compose and MiniStack options are documented in [.env.example](.env.example).

- `MINISTACK_IMAGE`: MiniStack image. Use `ministackorg/ministack:1.5.3-full` when features such as Athena with DuckDB are required.
- `MINISTACK_PORT`: Host port, defaulting to `4566`.
- `AWS_REGION`: Default MiniStack region, defaulting to `ap-northeast-1`.
- `MINISTACK_LOG_LEVEL`: MiniStack log level.
- `MINISTACK_RDS_PERSIST`: Controls persistence for RDS containers.
- `STACKPORT_IMAGE`: StackPort Web UI image, defaulting to `davireis/stackport:0.3.8`.
- `STACKPORT_PORT`: Host port for the StackPort Web UI, defaulting to `8080`.
- `STACKPORT_ALLOW_WRITES`: Enables resource mutation from StackPort. It defaults to `false` for a read-only resource browser.

Terraform environment parameters are defined in [terraform/values/development.tfvars](terraform/values/development.tfvars). Copy that file to add another environment, then update resource names, tags, and the relevant infrastructure category objects. When changing the MiniStack port or region, keep `.env` and the selected Terraform values file synchronized.

MiniStack mounts the Docker socket so it can launch real containers for services such as Lambda, RDS, and ECS. Use this configuration only in a trusted local development environment.
