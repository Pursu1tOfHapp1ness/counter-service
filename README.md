# Using of counter-service

1. Clone repo with this code.
2. Start building Dockerfile: `docker build ./Dockerfile --tag counter-service:0.0.1 .`
3. Start docker image **counter-service:0.0.1**: `docker run -dt --rm -p 80:80 counter-service:0.0.1`
