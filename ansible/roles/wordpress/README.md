Wordpress Role
=========

An Ansible Role that installs and configures WordPress on a web server. 

This role does not contain a database.

It needs the "DB" role (of this project) to be tested with molecule.

Requirements
------------

The host should be a **Debian-based** system (buster, bullseye, bookworm) with **Ansible installed**.

**Molecule 5.0.1** is required for testing.

**Docker** is required to run the Molecule tests.

A **mariadb** role or **mysql** role of this project is required for WordPress to work.

**db** role of this project is required for testing with molecule.

Role Variables
--------------

```
# defaults file for wordpress
wordpress_website_url: "localhost"
wordpress_site_title: "wp-site"
#users
wordpress_admin_username: "wpadmin"
wordpress_admin_password: "adminpassword123"
wordpress_admin_email: "admin@example.com"
wordpress_user_username: "foo"
wordpress_user_password: "foopassword123"
wordpress_user_email: "foo@example.com"
#database
wordpress_db_name: "wp-db"
wordpress_db_user: "db_user"
wordpress_db_password: "dbpassword123"
wordpress_db_host: "mariadb"
wordpress_db_port: 3306
#others
wordpress_path: "/var/www/html"
```

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - name: Include wordpress role
      ansible.builtin.include_role:
        name: wordpress
      vars:
        wp_website_url: "{{ website_url }}"
        wordpress_site_title: "{{ wp_site_title }}"
        #users
        wordpress_admin_username: "{{ wp_admin_username }}"
        wordpress_admin_password: "{{ wp_admin_password }}"
        wordpress_admin_email: "{{ wp_admin_email }}"
        wordpress_user_username: "{{ wp_user_username }}"
        wordpress_user_password: "{{ wp_user_password }}"
        wordpress_user_email: "{{ wp_user_email }}"
        #database
        wordpress_db_name: "{{ db_name }}"
        wordpress_db_user: "{{ db_user_username }}"
        wordpress_db_password: "{{ db_user_password }}"
        wordpress_db_host: "{{ db_host }}"
        wordpress_db_port: "{{ db_port }}"
        #others
        wordpress_path: "/var/www/html"
