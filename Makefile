repository = docker-jobs

default: build

build:
				docker build -t $(repository)/docker-jobs .

run:  build
	docker run -it -p 3000:3000 -v /var/run/docker.sock:/var/run/docker.sock $(repository)/docker-jobs

build_sample_jobs:
				docker build -t $(repository)/singer sample-jobs/singer/.
				docker build -t $(repository)/dancer sample-jobs/dancer/.
