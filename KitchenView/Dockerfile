FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 5000
ENV PYTHONUNBUFFERED="yes"

ENTRYPOINT ["python3", "app.py"]