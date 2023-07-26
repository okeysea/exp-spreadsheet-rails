COMPOSE_CMD=nerdctl compose

.PHONY: app-up app-sh

app-up:
	${COMPOSE_CMD} up

app-run-sh:
	${COMPOSE_CMD} run --rm app bash
