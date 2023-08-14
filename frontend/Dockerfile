FROM node:15.4 as builder
# Create app directory

WORKDIR /usr/src/app
COPY . .
RUN npm install \
    && npm run build

FROM nginx:1.25.1
WORKDIR /app
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
#EXPOSE 8080