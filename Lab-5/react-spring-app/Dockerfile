FROM alpine:latest as nginx

RUN apk update && \
    apk add --no-cache nginx && \
    adduser -D my_nginx && \
    chown -R my_nginx:my_nginx /var/lib/nginx /var/log/nginx /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=frontend /usr/share/nginx/html /usr/share/nginx/html

USER my_nginx

CMD ["nginx", "-g", "daemon off;"]
