include .env

.PHONY: all

build:
	docker build -t chatbot-ui-design .

run:
	export $(cat .env | xargs)
	docker stop chatbot-ui || true && docker rm chatbot-ui-design || true
	docker run --name chatbot-ui-design --rm -e OPENAI_API_KEY=${OPENAI_API_KEY} -p 3000:3000 chatbot-ui-design

logs:
	docker logs -f chatbot-ui-design

push:
	docker tag chatbot-ui:latest ${DOCKER_USER}/chatbot-ui:${DOCKER_TAG}
	docker push ${DOCKER_USER}/chatbot-ui:${DOCKER_TAG}
