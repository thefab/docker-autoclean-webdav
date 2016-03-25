build:
	docker build -f Dockerfile .

debug: build
	docker run -i -t -p 80:80 `docker images -q |head -1` bash
