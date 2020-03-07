FROM alpine:3.8 as builder

RUN apk update && apk add wget gcc make libc-dev

WORKDIR /app
RUN wget -O - http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz | tar -xzf -
RUN cd noip-*/ \
	&& make \
	&& mkdir /usr/local/etc \
	&& cp noip2 /usr/local/bin/noip2


FROM alpine:3.8

RUN mkdir /usr/local/etc
COPY --from=builder /usr/local/bin/noip2 /usr/local/bin/noip2

ENTRYPOINT /usr/local/bin/noip2 -C -u $USERNAME -p $PASSWORD -U 30 -Y && /usr/local/bin/noip2 && while kill -0 $(pgrep noip2) 2> /dev/null; do sleep 1; done
