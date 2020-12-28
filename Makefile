PACKAGE=satysfi-class-shinchoku-tairiku

.PHONY: all
all: install test doc

.PHONY: install
install:
	opam pin add ${PACKAGE}.dev "file://${PWD}" --yes --no-action
	opam reinstall ${PACKAGE}.dev --yes
	satyrographos install

.PHONY: doc
doc:
	opam pin add ${PACKAGE}-doc.dev "file://${PWD}" --yes --no-action
	opam install ${PACKAGE}-doc.dev --yes --deps-only
	satyrographos install
	satysfi doc/manual.saty

.PHONY: test
test: test-build test-check

.PHONY: test-build
test-build:
	./test/build.sh

.PHONY: test-build
test-check:
	./test/check.sh

.PHONY: clean
clean:
	rm -rf **/*.satysfi-aux test/*_{actual,diff}.pdf doc/manual.pdf
