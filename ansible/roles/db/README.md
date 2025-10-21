DB Role
=========

An Ansible role to install and configure MariaDB database server.

Create a database

Requirements
------------

The host should be a **Debian-based** system (buster, bullseye, bookworm) with **Ansible installed**.

**Molecule 5.0.1** is required for testing.

**Docker** is required to run the Molecule tests.

Role Variables
--------------

```
ansible_python_interpreter: /usr/bin/python3

conf_path: /etc/mysql/mariadb.cnf

mariadb_bind_address: "127.0.0.1"
mariadb_max_connections: 100
mariadb_connect_timeout: 5
mariadb_wait_timeout: 600
mariadb_max_allowed_packet: "16M"

db_name: "my_database"
db_admin_password: "adminpassword123"
db_user_username: "myusername123"
db_user_password: "mypassword123"
db_host: "db_container"
db_port: 3306
```

Testing
-------

You can run `molecule test` at the root of the role. Tests are described in `verify.yml`.

If an issue in encountered, make sure dependencies are installed: `python3 -m pip install molecule ansible-core`

Example Playbook
----------------

- hosts: db_container
  roles:
     - db
