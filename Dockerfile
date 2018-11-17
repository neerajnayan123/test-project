FROM nginx

COPY test.sh /

COPY html /usr/share/nginx/html

CMD ["./test.sh"]
