# uv-aio-template

[![Supported Python versions](https://img.shields.io/badge/python-3.9_%7C_3.10_%7C_3.11_%7C_3.12_%7C_3.13-blue?labelColor=grey&color=blue)](https://github.com/lloyd42/uv-aio-template/blob/main/pyproject.toml)
[![Docs](https://img.shields.io/badge/docs-gh--pages-blue)](https://lloyd42.github.io/uv-aio-template/)
[![Release](https://img.shields.io/github/v/release/lloyd42/uv-aio-template)](https://img.shields.io/github/v/release/lloyd42/uv-aio-template)
[![Build status](https://img.shields.io/github/actions/workflow/status/lloyd42/uv-aio-template/main.yml?branch=main)](https://github.com/lloyd42/uv-aio-template/actions/workflows/main.yml?query=branch%3Amain)
[![Commit activity](https://img.shields.io/github/commit-activity/m/lloyd42/uv-aio-template)](https://img.shields.io/github/commit-activity/m/lloyd42/uv-aio-template)

This is a template repository for Python projects that use uv for their dependency management.

- **Github repository**: <https://github.com/lloyd42/uv-aio-template/>
- **Documentation** <https://lloyd42.github.io/uv-aio-template/>

## Getting started with your project

### 1. Create a New Repository

First, create a repository on GitHub with the same name as this project, and then run the following commands:

```bash
git init -b main
git add .
git commit -m "init commit"
git remote add origin git@github.com:lloyd42/uv-aio-template.git
git push -u origin main
```

### 2. Set Up Your Development Environment

Then, install the environment and the pre-commit hooks with

```bash
just install
```

This will also generate your `uv.lock` file

### 3. Run the pre-commit hooks

Initially, the CI/CD pipeline might be failing due to formatting issues. To resolve those run:

```bash
uv run pre-commit run -a
```

### 4. Commit the changes

Lastly, commit the changes made by the two steps above to your repository.

```bash
git add .
git commit -m 'Fix formatting issues'
git push origin main
```

You are now ready to start development on your project!
The CI/CD pipeline will be triggered when you open a pull request, merge to main, or when you create a new release.

To finalize the set-up for publishing to PyPI, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/publishing/#set-up-for-pypi).
For activating the automatic documentation with MkDocs, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/mkdocs/#enabling-the-documentation-on-github).
To enable the code coverage reports, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/codecov/).

## Releasing a new version

To release a new version of your project, follow these steps:

1. Update the version number in `pyproject.toml` and `README.md`.
2. Commit the changes and push to your repository.
3. Create a new tag and push to your repository.
4. The CI/CD pipeline will automatically build and create a new release by current tag.

---

Repository initiated with [fpgmaas/cookiecutter-uv](https://github.com/fpgmaas/cookiecutter-uv).
