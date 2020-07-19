IMAGE=amutake/satysfi:nightly

.PHONY: example

example: example/.satysfi/dist/fonts
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi -C example/.satysfi example/main.saty

example/.satysfi/dist/fonts:
	./example/install-fonts.sh
