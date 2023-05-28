andrewrothstein.julia
=========
![Build Status](https://github.com/andrewrothstein/ansible-julia/actions/workflows/build.yml/badge.svg)

Installs [julia](https://julialang.org/).

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
    - andrewrothstein.julia
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
