# Alembic
Alembic template, with auto-generated revision and migrations.

Each database schema are separated into folders (Ex: `model/`) and revised/migrated independently for isolation.

![Integration](https://github.com/DarkbordermanTemplate/alembic/workflows/Integration/badge.svg)

## Development

### Prerequisitive

| Name | Version |
| --- | --- |
| Python | 3.8 |
| pipenv(Python module) | 2018.11.26 or up |

### Environment setup

0. Initialize environment variable
```
cp sample.env .env
```

1. Initialize Python environment
```
make init
```

2. Enter the environment and start developing
```
pipenv shell
```

3. Start related components of API service
```
make service_up
```

4. (Optional) Create revision
```
make model_revision
```

5. (Optional)Migrate to latest revision
```
make model_migrate
```

### Formatting

This project uses `black` and `isort` for formatting
```
make reformat
```

### Linting

This project uses `pylint` and `flake8` for linting
```
make lint
```

## Contribution

* Darkborderman/Divik(reastw1234@gmail.com)
