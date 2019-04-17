IMAGE=amutake/satysfi:0.0.3-dev2019.03.10

docker:
	docker run --rm -v $$(pwd):/home/opam/satysfi ${IMAGE} satysfi main.saty

main.pdf:
	satysfi main.saty
