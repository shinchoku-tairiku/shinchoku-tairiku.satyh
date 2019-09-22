IMAGE=amutake/satysfi:nightly

docker: .satysfi/dist/fonts
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi main.saty

block: .satysfi/dist/fonts
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi --debug-show-block-bbox --debug-show-block-space main.saty

inline: .satysfi/dist/fonts
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi --debug-show-bbox --debug-show-space main.saty

help: .satysfi/dist/fonts
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi -h

.satysfi/dist/fonts:
	./install-fonts.sh

main.pdf: .satysfi/dist/fonts
	satysfi main.saty
