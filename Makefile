MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

help:
	@printf "Make sure you have gcc, cargo, and cbindgen installed.\n"

build:
	cd $(MAKEPATH)/rust_in_c; cargo build
	cd $(MAKEPATH)/rust_in_c; cbindgen --config cbindgen.toml --crate rust_in_c --output $(MAKEPATH)/rustinc.h
	cd $(MAKEPATH); gcc main.c rustinc.h rust_in_c/target/debug/librust_in_c.so -o rust-in-c

install-dependencies:
	cargo install --force cbindgen

see-errors:
	-gcc -Wall -o errors $(MAKEPATH)/main.c
