# 使用 PowerShell 替代 sh:
set shell := ["powershell.exe", "-c"]

# 安装虚拟环境和预提交钩子
install:
    echo "🚀 Creating virtual environment using uv"
    uv sync
    uv run pre-commit install

# 运行代码质量工具
check:
    echo "🚀 Checking lock file consistency with 'pyproject.toml'"
    uv lock --locked
    echo "🚀 Linting code: Running pre-commit"
    uv run pre-commit run -a
    echo "🚀 Static type checking: Running mypy"
    uv run mypy
    echo "🚀 Checking for obsolete dependencies: Running deptry"
    uv run deptry .

# 使用 pytest 测试代码
test:
    echo "🚀 Testing code: Running pytest"
    uv run python -m pytest --cov --cov-config=pyproject.toml --cov-report=xml

# 构建 wheel 文件
build: clean-build
    echo "🚀 Creating wheel file"
    uvx --from build pyproject-build --installer uv

# 清理构建产物
clean-build:
    echo "🚀 Removing build artifacts"
    uv run python -c "import shutil; import os; shutil.rmtree('dist') if os.path.exists('dist') else None"

# 测试文档是否可以无警告或错误构建
docs-test:
    uv run mkdocs build -s

# 构建并服务文档
docs:
    uv run mkdocs serve

# 显示帮助信息
help:
 uv run python -c "import re; \
 [[print(f'\033[36m{m[0]:<20}\033[0m {m[1]}') for m in re.findall(r'^([a-zA-Z_-]+):.*?## (.*)$$', open('justfile').read(), re.M)]"

default: help
