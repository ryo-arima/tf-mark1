# GitHub Copilot repository instructions

## Project overview

- This repository is a Terraform infrastructure-as-code development environment that uses MiniStack as a local AWS emulator.
- MiniStack, Redis, and the StackPort Web UI run through `docker-compose.yaml`.
- Terraform runs on the host and is not included as a Compose service.
- Do not use a real AWS account or real AWS credentials.

## Prerequisites

- Docker Engine or Docker Desktop must be running.
- Docker Compose v2 must be available through the `docker compose` command.
- Use Terraform CLI `1.6.0` or later and earlier than `2.0.0`.
- Use `curl` for health checks and `make` for command shortcuts.
- The first run requires access to Docker Hub and the Terraform Registry.
- Host TCP ports `4566` and `8080` must be available. If the MiniStack port changes, keep `.env` and Terraform's `ministack_endpoint` synchronized.

## Local AWS defaults

- MiniStack endpoint: `http://localhost:4566`
- StackPort Web UI: `http://localhost:8080`
- AWS region: `ap-northeast-1`
- AWS account ID: `000000000000`
- Local credentials: access key `test`, secret key `test`
- Expose the MiniStack API and StackPort Web UI only on `127.0.0.1`.

## Repository structure

- `docker-compose.yaml` defines MiniStack, Redis, StackPort, persistent volumes, health checks, and the Docker network.
- `.env.example` defines configurable defaults for Compose and MiniStack.
- `terraform/versions.tf` defines Terraform and AWS provider version constraints.
- `terraform/provider.tf` routes supported AWS services to the MiniStack endpoint.
- `terraform/values/` owns environment parameter files and the environment composition entry point.
- `terraform/entity/module/` defines strict input types for infrastructure abstraction modules.
- `terraform/entity/service/` defines strict input types consumed by concrete AWS service templates.
- `terraform/entity/util/` defines strict input types for shared utility context.
- `terraform/modules/<concept>/` contains thin infrastructure abstractions such as datastore, load balancer, event, CI/CD, IAM, monitor, network, and security. Each abstraction calls modules under `terraform/templates/services/`.
- `terraform/modules/README.md` is the AWS service-to-category catalog and records the default representative for each implemented abstraction.
- `terraform/templates/services/<aws-service>/base.tf` validates service parameters through `terraform/entity/service/` and defines resources for one AWS service.
- `terraform/utils/` contains shared or miscellaneous Terraform processing that is not owned by one AWS service.
- `terraform/main.tf` only delegates infrastructure composition to `terraform/values/`.
- `Makefile` provides common Compose and Terraform operations.
- `README.md` documents setup and operating procedures for users.

## Implementation rules

- Use English `snake_case` names for Terraform resources, variables, outputs, and locals.
- Put environment-specific parameters in a `.tfvars` file under `terraform/values/`.
- Define and validate every values-layer abstraction object under `terraform/entity/module/`.
- Define and validate every service composition object under `terraform/entity/service/`.
- Put infrastructure abstractions under `terraform/modules/<concept>/` and have them call `terraform/templates/services/<aws-service>/`.
- Keep concept modules thin: they may derive names, merge tags, and connect dependencies, but must not define AWS resources or instantiate `entity/service` directly.
- Keep IAM one-to-one: `terraform/modules/iam/` may call only `terraform/templates/services/iam/`, and other concept modules must consume IAM outputs instead of calling the IAM service template directly.
- Connect cross-module dependencies in `terraform/values/base.tf`; concept modules must not reach into sibling concept modules.
- Instantiate `entity/service` from each concrete service template before using service parameters in AWS resources.
- Classify a new AWS service using `terraform/modules/README.md`; update the catalog when introducing or changing a category.
- Create one directory per AWS service under `terraform/templates/services/` and place its resource definitions in an exact `base.tf` file.
- Do not create AWS service directories directly under `terraform/templates/`.
- Put miscellaneous shared Terraform processing under `terraform/utils/`.
- Do not define AWS resources directly in the root module, values layer, or infrastructure abstraction modules; AWS resources belong under `terraform/templates/services/`.
- Wire every new infrastructure abstraction from `terraform/values/base.tf` and keep the root module limited to calling the values layer.
- Use `datastore` as the infrastructure abstraction name; do not use `storage` or the misspelling `strage` for this category.
- Format every changed Terraform file after editing it. Use the repository `make tf-fmt` target for the complete configuration.
- Do not commit generated Terraform artifacts such as `.terraform/`, `*.tfstate`, or `*.tfplan`.
- Keep `.terraform.lock.hcl` under version control for reproducibility.
- Do not commit `.env`; update `.env.example` when shared configuration examples change.
- When changing MiniStack, Terraform, or AWS provider versions, keep Compose, Terraform constraints, the lock file, and README documentation synchronized.
- Write all documentation, comments, descriptions, validation messages, and operational text in English.
- Preserve existing user changes and do not modify files unrelated to the request.

## AWS connection safety

- Never change an AWS provider endpoint to a real AWS endpoint.
- When adding an AWS service, add its corresponding entry to `terraform/provider.tf` and route it to MiniStack.
- Never add real AWS access keys, secrets, profiles, ARNs, or account IDs to code or configuration examples.
- The Docker socket mount is required to run local Lambda, RDS, ECS, and similar workloads. Do not remove it unless explicitly requested.
- Preserve the MiniStack persistent volume and loopback-only port binding.
- Keep StackPort connected to `http://ministack:4566` on the Compose network and read-only by default.

## Verification

Run the relevant commands for the files changed:

```sh
docker compose config
docker compose up -d --wait
curl --fail http://localhost:4566/_ministack/health
curl --fail http://localhost:8080/api/health
find terraform -type f -name '*.tf' -not -path '*/.terraform/*' -exec terraform fmt -check {} +
terraform -chdir=terraform init
terraform -chdir=terraform validate
terraform -chdir=terraform plan -var-file=values/development.tfvars
```

- For Compose changes, run `docker compose config` and verify both MiniStack and StackPort health endpoints.
- For Terraform changes, run `fmt`, `validate`, and `plan`.
- Run `terraform apply` only when implementation verification requires it and after confirming that Terraform connects exclusively to MiniStack.
- Run `terraform destroy`, `make reset`, or `docker compose down -v` only when explicitly required because they delete state or resources.

## Completion criteria

- Syntax validation succeeds for every changed configuration file.
- Terraform code follows the `values/`, `entity/`, `modules/`, `templates/services/`, and `utils/` layer boundaries.
- MiniStack reports a healthy status.
- StackPort reports a healthy status and reaches MiniStack through the Compose network.
- The Terraform plan shows only the intended changes.
- README documentation and configuration examples match the implementation.
