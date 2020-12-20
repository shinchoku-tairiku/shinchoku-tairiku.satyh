PACKAGE=satysfi-class-shinchoku-tairiku
IMAGE=amutake/satysfi:opam-slim

.PHONY: doc doc-ci clean

doc: .satysfi
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi doc/manual.saty

.satysfi:
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} sh -c "opam pin add ${PACKAGE} . && satyrographos install --output .satysfi/dist --copy"

doc-ci:
	opam pin add ${PACKAGE} .
	opam pin add ${PACKAGE}-doc . --deps-only
	satysfi doc/manual.saty

clean:
	rm -rf .satysfi
