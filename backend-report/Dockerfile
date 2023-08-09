FROM python:latest
COPY . .
WORKDIR /app
ADD app.py /app
ADD requirements.txt
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 8080