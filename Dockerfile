FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app/

RUN pip install --upgrade pip --no-cache-dir && pip freeze > /app/requirements.txt
RUN pip install -r /app/requirements.txt --no-cache-dir
#CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
CMD [ "gunicorn", "jg_back.wsgi:application", "--bind", "0.0.0.0:8000" ]