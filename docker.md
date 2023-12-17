docker buildx create --use --name mybuild

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag hartmutcouk/pg-repack-docker:1.5.0 \
    --tag hartmutcouk/pg-repack-docker:latest \
    --push .
