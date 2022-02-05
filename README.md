# stonesoupkitchen-banner

An Ansible role for configuring services that display banners to users.

## Requirements

Supported operating systems:
* Debian 10 (Buster)
* Debian 11 (Bullseye)

## Role Variables

TODO.

## Examples

```yaml
- hosts: all
  roles:
    - stonesoupkitchen.sudo
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

