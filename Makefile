TF_DIR := terraform
TF_FILES := $(shell find $(TF_DIR) -type f -name '*.tf' -not -path '*/.terraform/*')
TF_VALUES_FILE ?= values/development.tfvars
MINISTACK_URL ?= http://localhost:4566
STACKPORT_URL ?= http://localhost:8080

.PHONY: up down logs health stackport-health reset tf-init tf-fmt tf-validate tf-plan tf-apply tf-destroy

up:
	docker compose up -d --wait

down:
	docker compose down

logs:
	docker compose logs -f ministack

health:
	curl --fail --silent --show-error "$(MINISTACK_URL)/_ministack/health"

stackport-health:
	curl --fail --silent --show-error "$(STACKPORT_URL)/api/health"

reset:
	curl --fail --silent --show-error -X POST "$(MINISTACK_URL)/_ministack/reset"

tf-init:
	terraform -chdir=$(TF_DIR) init

tf-fmt:
	terraform fmt $(TF_FILES)

tf-validate:
	terraform -chdir=$(TF_DIR) validate

tf-plan:
	terraform -chdir=$(TF_DIR) plan -var-file=$(TF_VALUES_FILE)

tf-apply:
	terraform -chdir=$(TF_DIR) apply -var-file=$(TF_VALUES_FILE)

tf-destroy:
	terraform -chdir=$(TF_DIR) destroy -var-file=$(TF_VALUES_FILE)
