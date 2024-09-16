all: apply

up: apply

apply:
	@cd infra && terraform apply -auto-approve

init:
	@cd infra && terraform init

down:
	@cd infra && terraform destroy -auto-approve

plan:
	@cd infra && terraform plan