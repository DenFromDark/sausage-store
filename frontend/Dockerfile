FROM node:15.4
# Create app directory

WORKDIR /usr/src/app
COPY . .
RUN npm install \
    && npm install -g http-server \
    && npm run build
#EXPOSE 80
CMD ["http-server", "dist/frontend/", "--proxy", "http://backend:8080"]
