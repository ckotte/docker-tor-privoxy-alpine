FROM alpine:3.6

RUN apk --update add privoxy tor runit

COPY service /etc/service/
#COPY entrypoint.sh /

EXPOSE 8118 9050

#ENTRYPOINT ["/entrypoint.sh"]
CMD ["runsvdir", "/etc/service"]
