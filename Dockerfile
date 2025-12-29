FROM python:3.11-alpine

# Install system dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Set working directory
WORKDIR /app

# Copy files
COPY . /app

# Install dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir .

# Expose Render port
EXPOSE 8000

# Run MCP server as HTTP service
CMD ["sh", "-c", "uvicorn duckduckgo_mcp_server.server:app --host 0.0.0.0 --port $PORT"]
