help:
	@printf "Make sure you have build-essential, cargo, and cbindgen installed.\n"

install-dependencies:
	cargo install --force cbindgen

build:
	cargo build
	cbindgen --config cbindgen.toml --crate rust_in_c --output target/debug/rustinc.h

test:
	cp src/* target/debug/

remove-cache:
	rm -r target/debug

see-errors:
	gcc -Wall -o errors src/main.c
