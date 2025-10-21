WEB (Nginx web server)
=========

An Ansible role to install and configure Nginx web server on Debian-based systems.

Requirements
------------

The host should be a **Debian-based** system (buster, bullseye, bookworm) with **Ansible installed**.

**Molecule 5.0.1** is required for testing.

**Docker** is required to run the Molecule tests.

Role Variables
--------------

```
ansible_python_interpreter: /usr/bin/python3

# Replace default nginx.conf if needed
nginx_main_conf: {}


# Contains nginx site configurations (example bellow)
nginx_confs: {}

```

Example Playbook
----------------
# Vars
yaml_nginx_confs:
  custom.conf:
    server:
      listen: 80
      server_name: example.com
      root: /var/www/html;
      index: index.php index.html index.htm;
    server:
      listen: 443 ssl
      server_name: example.com
      ssl_certificate: /etc/ssl/certs/example.com.crt
      ssl_certificate_key: /etc/ssl/private/example.com.key
      root: /var/www/html;
      index: index.php index.html index.htm;

# Playbook
    - hosts: servers
      roles:
         - role: web
            nginx_confs: {{ yaml_nginx_confs }}

