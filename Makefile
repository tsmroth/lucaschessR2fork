APPLICATION_NAME ?= lucaschessr2

build:
	docker build -t ${APPLICATION_NAME} --network host .

run:
	mkdir -p UserData
	docker run -e DISPLAY \
		-v ~/.Xauthority:/lucaschess/.Xauthority:ro \
		-v $(shell pwd)/UserData:/lucaschess/UserData \
		--network host \
		--name ${APPLICATION_NAME} \
		--rm \
		${APPLICATION_NAME}

runwsl:
	mkdir -p UserData
	docker run -v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /mnt/wslg:/mnt/wslg \
		-e DISPLAY \
		-e WAYLAND_DISPLAY \
		-e XDG_RUNTIME_DIR \
		-e PULSE_SERVER \
		-v $(shell pwd)/UserData:/lucaschess/UserData \
		--network host \
		--name ${APPLICATION_NAME} \
		--rm \
		${APPLICATION_NAME}