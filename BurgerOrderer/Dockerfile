FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

# Install system dependencies needed for psycopg2
RUN apt-get update \
    && apt-get -y install libpq-dev gcc

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["python", "app.py"]
