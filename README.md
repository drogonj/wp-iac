### In development...

# WP-IaC

A personnal project, focused on applying Terraform and Ansible best practices. It provisions a three-container WordPress stack on a local Docker host, using Terraform modules and Ansible roles to keep infrastructure and configuration code modular and reusable.

## Architecture

- **Terraform** uses the `kreuzwerker/docker` provider to declare Docker images, networks, volumes, and three containers (database, web server, and WordPress).
- Each container is encapsulated in its own Terraform module: `modules/db`, `modules/web`, and `modules/wordpress`.
- Terraform also generates an inventory for Ansible, then ensures Python is available inside every container so Ansible can connect via the Docker transport.
- **Ansible** orchestrates configuration through dedicated roles: `roles/db`, `roles/web`, and `roles/wordpress`, executed via focused playbooks grouped in `site.yml`.
- Molecule scenarios under each role validate the Ansible logic in isolation using Docker-based test instances.

## Prerequisites

- Docker Engine 24+ running on the local host
- Terraform 1.12 or newer
- Ansible Core 2.15+ with the `community.docker` collection
- Python 3.10+ and `pip` for Molecule testing

Optional tools:

- Molecule 5+ with the Docker driver for role verification
- GNU Make (used by the provided `Makefile` targets)

## Quick start

1. Fill `ansible/group_vars/all.yml` with your desired configuration values.

2. Initialize the Terraform working directory:
   ```bash
   make init
   ```
3. Review the execution plan:
   ```bash
   make plan
   ```
4. Provision the infrastructure and run the Ansible playbooks:
   ```bash
   make apply
   ```
5. When you are done, tear everything down:
   ```bash
   make destroy
   ```

The `apply` target builds the containers, writes inventory data, and invokes Ansible to configure the services. After completion, WordPress is available on the published web port defined in `terraform.tfvars`.

## Ansible layout

- `playbooks/` contains per-tier entrypoints (`db.yml`, `wordpress.yml`, `web.yml`).
- `roles/` hosts reusable role logic for each container, including handlers, templates, and defaults.
- `group_vars/all.yml` must be filled by the user.

Run all playbooks together with:

```bash
cd ansible
ansible-playbook site.yml
```

## Testing with Molecule

Each role exposes a Molecule scenario under `roles/<role>/molecule/default`. To execute tests for a role (for example, the database role):

```bash
cd ansible/roles/db
molecule test
```

Molecule provisions a disposable Docker container, applies the role, and verifies expectations defined in `verify.yml`.

## Todo ???

- Add CI pipelines to run `terraform fmt`, `terraform validate`, and Molecule automatically.
- Use ansible-vault for secrets management
