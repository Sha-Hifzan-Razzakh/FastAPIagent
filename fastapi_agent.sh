#!/usr/bin/env bash
set -euo pipefail

APP_NAME="${1:-fastapi-agent-tasks}"

echo "📁 Creating scaffold: $APP_NAME"
mkdir -p "$APP_NAME"/{app/{api,v1},tests,scripts}
cd "$APP_NAME"

# empty placeholders
touch app/__init__.py app/api/__init__.py app/v1/__init__.py
: > app/main.py
: > app/agent_api.py
: > app/agent_runtime.py
: > app/agent_tools.py
: > tests/__init__.py

# minimal helper files (empty or minimal)
cat > .gitignore <<'EOF'
.venv/
__pycache__/
*.pyc
.env
.DS_Store
.pytest_cache/
coverage/
EOF

# empty pyproject; fill later
cat > pyproject.toml <<'EOF'
[project]
name = "fastapi-agent-tasks"
version = "0.0.0"
requires-python = ">=3.11"
dependencies = []
EOF

# empty requirements (use if you prefer)
: > requirements.txt

# empty run script placeholder
cat > scripts/dev.sh <<'EOF'
#!/usr/bin/env bash
# Add your uvicorn command here later, e.g.:
# uvicorn app.main:app --reload --port 8000
EOF
chmod +x scripts/dev.sh

echo "✅ Scaffold ready.
Structure:
$APP_NAME/
  app/
    __init__.py
    main.py
    agent_api.py
    agent_runtime.py
    agent_tools.py
    api/__init__.py
    v1/__init__.py
  tests/__init__.py
  scripts/dev.sh
  .gitignore
  pyproject.toml
  requirements.txt
"
