andrewrothstein.kubeseal
=========
![Build Status](https://github.com/andrewrothstein/ansible-kubeseal/actions/workflows/build.yml/badge.svg)

Installs Bitname Labs' [kubeseal for sealed secrets](https://github.com/bitnami-labs/sealed-secrets).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.kubeseal
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
