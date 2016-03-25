build:
	docker build -f Dockerfile .

debug: build
	docker run -i -t -p 8081:80 `docker images -q |head -1` bash
