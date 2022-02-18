[![CI](https://github.com/StoneSoupKitchen/ansible-role-banner/actions/workflows/ci.yml/badge.svg)](https://github.com/StoneSoupKitchen/ansible-role-banner/actions/workflows/ci.yml)

# Ansible role: banner

An Ansible role for configuring services that display banners to users.

## Requirements

Supported operating systems:
* Debian 10 (Buster)
* Debian 11 (Bullseye)

## Role Variables

The following table lists all variables that can be overridden
and their default values.

| Name           | Default Value    | Description                         |
| -------------- | ---------------- | ----------------------------------- |
| `banner_msg`   | See defaults.yml | The default message to show to users on login.|

## Examples

```yaml
- hosts: all
  roles:
    - stonesoupkitchen.banner
```

## Development

A Makefile is included for easier development with `pipenv`.
After cloning this repository,
use the following commands to set up an environment.

    pipenv install --dev

To lint your changes with ansible-lint:

    make lint

To run tests with molecule:

    make test

## License

See [LICENSE](./LICENSE).

