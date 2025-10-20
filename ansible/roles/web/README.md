WEB (Nginx web server)
=========

A brief description of the role goes here.

Requirements
------------

The host should be a **Debian-based** system (buster, bullseye, bookworm) with **Ansible installed**.

**Molecule 5.0.1** is required for testing.

**Docker** is required to run the Molecule tests.

Role Variables
--------------

```
ansible_python_interpreter: /usr/bin/python3

# nginx.conf to include
nginx_main_conf: ""

# conf.d/ files to include
nginx_confs : {
  "example.conf": "server { listen 80; server_name example.com; }"
}

# sites-available/default.conf (Key:Value pairs -> Key:name_of_conf_file, Value: content of the file)
nginx_site_available_confs: {
  "default.conf": "server { listen 80; server_name _; }"
}

# sites-enabled/default.conf (Key:Value pairs -> Key:name_of_conf_file, Value: content of the file)
nginx_site_enabled_confs: {
  "default.conf": "server { listen 80; server_name _; }"
}
```

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: web
            nginx_main_conf: "/etc/nginx/nginx.conf"
            nginx_confs:
              "example.conf": |
                server {
                  listen 80;
                  server_name example.com;
                }
            nginx_site_available_confs:
              "default.conf": |
                server {
                  listen 80;
                  server_name _;
                }
            nginx_site_enabled_confs:
              "default.conf": |
                server {
                  listen 80;
                  server_name _;
                }
