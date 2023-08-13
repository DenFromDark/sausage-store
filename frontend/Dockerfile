FROM node:15.4 as builder
# Create app directory

WORKDIR /usr/src/app
COPY . .
RUN npm install \
    && npm run build
#EXPOSE 80
#CMD ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://backend:8080"]

FROM nginx:1.25.1-apine
WORKDIR /app
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
EXPOSE 8080