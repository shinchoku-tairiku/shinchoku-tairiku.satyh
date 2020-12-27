PACKAGE=satysfi-class-shinchoku-tairiku
IMAGE=amutake/satysfi:opam-slim

.PHONY: doc doc-ci clean

doc: .satysfi
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} satysfi doc/manual.saty

.satysfi:
	docker run --rm -v $$(pwd):/satysfi ${IMAGE} sh -c "opam pin add ${PACKAGE} . && satyrographos install --output .satysfi/dist --copy"

doc-ci:
	opam pin add . --no-action
	opam install ${PACKAGE}-doc --deps-only
	opam exec -- satyrographos install
	opam exec -- satysfi doc/manual.saty

test: test-build test-check

test-build:
	./test/build.sh

test-check:
	./test/check.sh

clean:
	rm -rf .satysfi test/*_actual.pdf test/*_diff.pdf doc/manual.pdf **/*.satysfi-aux
