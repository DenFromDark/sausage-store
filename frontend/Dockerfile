FROM node:15.4 as builder
# Create app directory

WORKDIR /usr/src/app
COPY . .
RUN npm install \
    && npm run build

FROM nginx:latest
WORKDIR /app
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
COPY --from=builder /usr/src/app/nginx.tmpl /app/nginx.tmpl
