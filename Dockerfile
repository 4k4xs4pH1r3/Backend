FROM python:3.11.0b3-slim

ENV PYTHONUNBUFFERED 1

ARG APP=/app
WORKDIR $APP
VOLUME $APP

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

CMD [ "./manage.py", "runserver", "0:3000" ]

EXPOSE 3000