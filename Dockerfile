FROM python:3.11-alpine

# System deps
RUN apk add --no-cache gcc musl-dev linux-headers

WORKDIR /app

# Install the MCP server from PyPI
RUN pip install --upgrade pip \
    && pip install --no-cache-dir duckduckgo-mcp-server

# Expose Render port
EXPOSE 8000

# Run MCP server in HTTP mode
CMD ["sh", "-c", "uvicorn duckduckgo_mcp_server.server:app --host 0.0.0.0 --port $PORT"]
