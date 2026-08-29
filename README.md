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

The development values create a VPC, an ECS cluster, a DynamoDB table, and an SQS queue. Each AWS provider endpoint is pinned to `localhost:4566`, and the provider uses local `test` credentials, so no real AWS credentials are required.

## Terraform structure

The Terraform configuration separates environment values, infrastructure abstractions, AWS service composition, reusable resources, entity types, and shared utility processing.

```text
terraform/
|-- entity/
|   |-- module/             # Network, compute, storage, and messaging input types
|   |-- service/            # VPC, ECS, DynamoDB, and SQS input types
|   `-- util/               # Shared context types
|-- main.tf
|-- modules/
|   |-- compute/
|   |-- messaging/
|   |-- network/
|   `-- storage/
|-- provider.tf
|-- templates/
|   |-- dynamodb/           # Reusable resource template
|   |-- ecs/
|   |-- services/
|   |   |-- dynamodb/       # AWS service composition
|   |   |-- ecs/
|   |   |-- sqs/
|   |   `-- vpc/
|   |-- sqs/
|   `-- vpc/
|-- utils/
|   `-- naming.tf
`-- values/
    |-- base.tf             # Environment composition entry point
    `-- development.tfvars  # Local development parameters
```

The dependency flow is:

```text
root -> values -> modules -> templates/services -> templates
          |          |
          |          `-> entity/service
          `-> entity/module and entity/util
```

- `values/` owns environment parameters and calls infrastructure abstraction modules.
- `entity/` centralizes strict Terraform object types and validation at module, service, and utility boundaries.
- `modules/` exposes infrastructure concepts such as network, compute, storage, and messaging. These modules derive service-specific settings and call `templates/services/`.
- `templates/services/<aws-service>/base.tf` composes a reusable AWS resource template for one AWS service.
- `templates/<aws-service>/` contains reusable AWS resource definitions.
- `utils/` contains shared or miscellaneous Terraform processing that is not owned by one AWS service.
- The root `main.tf` delegates composition to `values/` and does not define AWS resources directly.

To add an infrastructure concept, define its values schema under `entity/module/`, create its module under `modules/`, map it to typed service parameters under `entity/service/`, and call the module from `values/base.tf`. Add or reuse the corresponding resource and service templates as required.

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

Terraform environment parameters are defined in [terraform/values/development.tfvars](terraform/values/development.tfvars). Copy that file to add another environment, then update resource names, tags, network settings, compute settings, storage settings, and messaging settings. When changing the MiniStack port or region, keep `.env` and the selected Terraform values file synchronized.

MiniStack mounts the Docker socket so it can launch real containers for services such as Lambda, RDS, and ECS. Use this configuration only in a trusted local development environment.
