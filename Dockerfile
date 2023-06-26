FROM public.ecr.aws/docker/library/alpine:latest
RUN apk add --no-cache libxml2-utils
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
