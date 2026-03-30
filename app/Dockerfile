FROM --platform=linux/amd64 python:3.10-slim AS build
WORKDIR /app
RUN pip install Flask psycopg2-binary
COPY app.py .
CMD ["python", "app.py"]