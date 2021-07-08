.PHONY: clean init

init: clean
	pipenv install --dev
	pipenv run pre-commit install

service_up:
	docker-compose up -d postgres

service_down:
	docker-compose down && docker volume rm postgres_data

analysis: bandit mypy

bandit:
	pipenv run bandit model/

mypy:
	pipenv run mypy model/

reformat: isort black

black:
	pipenv run black model/schema

isort:
	pipenv run isort model/schema

lint: flake8 pylint

flake8:
	pipenv run flake8 model/schema --max-line-length=120

pylint:
	pipenv run pylint --rcfile=setup.cfg model/schema

ci-bundle: analysis reformat lint

clean:
	find . -type f -name '*.py[co]' -delete
	find . -type d -name '__pycache__' -delete
	rm -rf dist
	rm -rf build
	rm -rf *.egg-info
	rm -rf .hypothesis
	rm -rf .pytest_cache
	rm -rf .tox
	rm -f report.xml
	rm -f coverage.xml

model_migrate:
	cd model/ && pipenv run alembic upgrade heads

model_revision:
	cd model && pipenv run alembic revision --autogenerate -m "migration"
