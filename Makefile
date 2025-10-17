
all: apply

init:
	@read -p "This will initialize the Terraform working directory. Continue? (y/n): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		terraform -chdir=./terraform init -upgrade; \
	else \
		echo "Initialization cancelled."; \
	fi

apply:
	@echo "Be sure to run 'make init', 'make plan' before applying changes."
	@read -p "Are you sure you want to apply the changes? (y/n): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		set -e; \
		terraform -chdir=./terraform apply -auto-approve; \
		echo "Applying Ansible playbook..."; \
		ansible-playbook -i ansible/inventories/terraform.ini ansible/main.yml; \
		echo "Apply operation completed."; \
	else \
		echo "Apply operation cancelled."; \
	fi

provision:
	@read -p "Are you sure you want to provision the servers with Ansible? (y/n): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		echo "Running Ansible playbook..."; \
		ansible-playbook -i ansible/inventories/terraform.ini ansible/main.yml; \
		echo "Provision operation completed."; \
	else \
		echo "Provision operation cancelled."; \
	fi

destroy:
	@read -p "Are you sure you want to destroy the infrastructure? (y/n): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		terraform -chdir=./terraform destroy -auto-approve; \
	else \
		echo "Destroy operation cancelled."; \
	fi

plan:
	@terraform -chdir=./terraform plan

clean-cache:
	@rm -rf terraform/.terraform
	@rm -rf terraform/.terraform.lock.hcl
	@rm -rf terraform/terraform.tfstate*
	@echo "Terraform cache cleaned."