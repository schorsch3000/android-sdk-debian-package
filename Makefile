build-package: build-container
	mkdir -p ${PWD}/artifacts
	docker run -v ${PWD}/artifacts:/build -t android-sdk-debian-package

build-container:
	docker build -t android-sdk-debian-package .
login: build-container
	docker run -i -t android-sdk-debian-package /bin/bash
