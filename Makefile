build:
	docker build -f Dockerfile.squashed -t thefab/autoclean-webdav:latest .

devbuild:
	docker build -f Dockerfile.dev .

debug: devbuild
	docker run -i -t -p 8081:80 thefab/autoclean-webdav:latest bash
