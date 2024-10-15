FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

# Install system dependencies needed for psycopg2
RUN apt-get update \
    && apt-get -y install libpq-dev gcc

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD ["python3", "test_checker.py"]