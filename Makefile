build:
	docker build -f Dockerfile.squashed .

devbuild:
	docker build -f Dockerfile.dev .

debug: devbuild
	docker run -i -t -p 8081:80 `docker images -q |head -1` bash
