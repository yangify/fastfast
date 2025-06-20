FROM python:3.12-slim

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the application into the container.
COPY . /fastfast

# Install the application dependencies.
WORKDIR /fastfast
RUN uv sync --frozen --no-cache

# Run the application.
CMD ["/fastfast/.venv/bin/fastapi", "run", "/fastfast/app/main.py", "--port", "80", "--host", "0.0.0.0"]