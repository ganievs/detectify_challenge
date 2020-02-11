CHALLENGE_LOCAL_IMAGE = challenge_local
DETECTIFY_CHALLENGE_LOCAL_IMAGE = detectify_challenge_local
GIT_INFO = $(shell git log -1 --format=%h)

default: build

build: build-challenge-local build-detectify-challenge-local
	@eval $$(minikube docker-env) ;\

build-challenge-local:
	@echo building docker image=$(CHALLENGE_LOCAL_IMAGE):latest
	@docker build --build-arg GIT_COMMIT=$(GIT_INFO) -t $(CHALLENGE_LOCAL_IMAGE) challenge.local/

build-detectify-challenge-local:
	@echo building docker image=$(DETECTIFY_CHALLENGE_LOCAL_IMAGE):latest
	@docker build -t $(DETECTIFY_CHALLENGE_LOCAL_IMAGE) --build-arg GIT_COMMIT=$(GIT_INFO) detectify.challenge.local/

deploy: deploy-challenge-local deploy-detectify-challenge-local

deploy-challenge-local:
	@echo deploying challenge.local
	@kubectl apply -f challenge.local/

deploy-detectify-challenge-local:
	@echo deploying detectify.challenge.local
	@kubectl apply -f detectify.challenge.local/
