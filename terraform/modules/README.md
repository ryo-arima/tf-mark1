# Infrastructure module catalog

The directories in this location classify AWS services by infrastructure concept. Concept modules are intentionally thin: they derive names, merge common tags, connect cross-category dependencies, and delegate AWS resources to `../templates/services/<aws-service>/`. Service templates perform service-level type validation through `../entity/service/`.

The default development values provision one lightweight representative for every implemented category. Other service families in the same row are classification targets for future templates; their presence in this catalog does not mean that a resource is already implemented.

| Module category | AWS service families | Default representative |
| --- | --- | --- |
| `analytics` | Athena, EMR, Firehose, Glue | Glue catalog database |
| `api` | API Gateway, API Gateway v2, AppSync | API Gateway v2 HTTP API |
| `cicd` | CodeBuild | CodeBuild project |
| `compute` | ECS, Lambda | ECS cluster |
| `configuration` | CloudFormation, SSM Parameter Store | SSM parameter |
| `datastore` | DynamoDB, EFS, ElastiCache, RDS, S3, S3 Control | DynamoDB table |
| `dns` | Route 53 | Route 53 hosted zone |
| `event` | EventBridge, EventBridge Pipes, EventBridge Scheduler, Step Functions | EventBridge event bus |
| `iam` | IAM | CodeBuild service role |
| `loadbalancer` | Elastic Load Balancing v2 | Application load balancer and HTTP listener |
| `messaging` | Kinesis, MSK, SES, SNS, SQS | SQS queue |
| `monitor` | CloudTrail, CloudWatch metrics, CloudWatch Logs, Config | CloudWatch log group |
| `network` | CloudFront, EC2 networking | VPC and subnets |
| `registry` | ECR | ECR repository |
| `security` | ACM, Cognito, KMS, Secrets Manager, STS, WAFv2 | KMS key and alias |

Bedrock and Bedrock Agent belong to a future `ai` category. Add that category only when an AI resource is required by an environment, so the default stack remains lightweight.

The current category names replace three earlier names while preserving Terraform resource addresses with `moved` blocks:

- `storage` became `datastore`.
- `integration` became `event`.
- `logging` became `monitor`.

IAM uses a strict one-to-one boundary: `modules/iam` calls only `templates/services/iam`. The values layer passes the IAM role ARN to the CI/CD module, which calls only the CodeBuild service template. A `moved` block preserves the earlier IAM role address under the CI/CD module.

The values layer owns the two current cross-module dependency edges:

- `network` provides subnet IDs to `loadbalancer`.
- `iam` provides the service role ARN to `cicd`.

Concept modules must not reach into another concept module or call another concept's service template directly.

When adding a service:

1. Select the category from this catalog or document a new infrastructure concept.
2. Define the category values type in `../entity/module/`.
3. Define the service type in `../entity/service/`.
4. Put AWS resources in `../templates/services/<aws-service>/base.tf`.
5. Validate the service object from its service template and expose only useful outputs.
6. Wire the category through `../values/` and the root module.
7. Route the AWS provider service endpoint to MiniStack before validation.
