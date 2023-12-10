FROM python:3.9.10-slim-bullseye as libs

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:3.9.10-slim-bullseye

EXPOSE 8000

WORKDIR /app

COPY --from=libs /usr/local /usr/local
COPY . .

CMD ["bash",  "entrypoint.sh"]

