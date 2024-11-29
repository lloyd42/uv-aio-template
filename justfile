# use PowerShell replace sh
set shell := ["powershell.exe", "-c"]

# default task: show the available tasks
default:
    just --list

# install: Install the virtual environment and install the pre-commit hooks
install:
    echo "🚀 Creating virtual environment using uv"
    uv sync
    uv run pre-commit install

# check: Run code quality tools
check:
    echo "🚀 Checking lock file consistency with 'pyproject.toml'"
    uv lock --locked
    echo "🚀 Linting code: Running pre-commit"
    uv run pre-commit run -a
    echo "🚀 Static type checking: Running mypy"
    uv run mypy
    echo "🚀 Checking for obsolete dependencies: Running deptry"
    uv run deptry .

# test: Test the code with pytest
test:
    echo "🚀 Testing code: Running pytest"
    uv run python -m pytest --cov --cov-config=pyproject.toml --cov-report=term

# build: Build wheel file
build: clean-build
    echo "🚀 Creating wheel file"
    uvx --from build pyproject-build --installer uv

# clean-build: Clean build artifacts
clean-build:
    echo "🚀 Removing build artifacts"
    uv run python -c "import shutil; import os; shutil.rmtree('dist') if os.path.exists('dist') else None"

# docs-test: Test if documentation can be built without warnings or errors
docs-test:
    uv run mkdocs build -s

# docs: Build and serve the documentation
docs:
    uv run mkdocs serve

# help: Show the available commands, the functional effect is similar to `just --list`
help:
    uv run python -c "[print(f'\033[36m{i.strip()}\033[0m') for i in [line.strip().split(' ',1)[1] for line in open('justfile',encoding='utf-8').readlines() if line.strip().startswith('#')][1:]]"
