testjs: ## Clean and Make js tests
	yarn test

testpy: ## Clean and Make unit tests
	python3 -m pytest -v jupyterlab_iex/tests --cov=jupyterlab_iex

tests: lint ## run the tests
	python3 -m pytest -v jupyterlab_iex/tests --cov=jupyterlab_iex --junitxml=python_junit.xml --cov-report=xml --cov-branch
	cd js; yarn test

build: ## build python and js
	python3 setup.py build

lint: ## run linter
	python3 -m flake8 jupyterlab_iex setup.py
	cd js; yarn lint

fix:  ## run autopep8/tslint fix
	python3 -m autopep8 --in-place -r -a -a jupyterlab_iex/ jupyterlab_iex/*/*
	cd js; yarn fix

annotate: ## MyPy type annotation check
	python3 -m mypy -s jupyterlab_iex

annotate_l: ## MyPy type annotation check - count only
	python3 -m mypy -s jupyterlab_iex | wc -l

clean: ## clean the repository
	find . -name "__pycache__" | xargs  rm -rf
	find . -name "*.pyc" | xargs rm -rf
	find . -name ".ipynb_checkpoints" | xargs  rm -rf
	rm -rf .coverage coverage cover htmlcov logs build dist *.egg-info lib node_modules .autoversion .pytest_cache lab-dist
	rm -rf js/node_modules js/lab-dist js/coverage js/lib
	make -C ./docs clean
	rm -rf ./docs/_build ./docs/api

docs:  ## make documentation
	make -C ./docs html
	open ./docs/_build/html/index.html

install:  ## install to site-packages
	python3 -m pip install .

serverextension: install ## enable serverextension
	python3 -m jupyter serverextension enable --py jupyterlab_iex

js:  ## build javascript
	cd js; yarn
	cd js; yarn build

labextension: js ## enable labextension
	cd js; jupyter labextension install .

dist: js  ## create dists
	rm -rf dist build
	python3 setup.py sdist bdist_wheel

publish: dist  ## dist to pypi and npm
	python3 -m twine check dist/* && twine upload dist/*
	cd js; npm publish

# Thanks to Francoise at marmelab.com for this
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%:
	@echo '$*=$($*)'

.PHONY: clean install serverextension labextension test tests help docs dist build lint test tests testjs testpy js
