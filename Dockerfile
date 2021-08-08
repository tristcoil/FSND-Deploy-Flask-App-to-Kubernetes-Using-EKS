# dockerhub python sctretch is rate limited
#FROM python:stretch

# so using AWS registry instead
FROM public.ecr.aws/bitnami/python:3.7


COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
