FROM python:latest

WORKDIR /app
ADD app.py /app
ADD requirements.txt /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 8080