test: image build/rustls
	image=$(shell docker build -q .) && \
		echo "Building crate in container" && \
		docker run --rm --user $(shell id -u):$(shell id -g) -v $$PWD/build:/github/home $$image "build --release" "rustls" "" && \
		echo "Running cleanup" && \
		docker run --rm --user $(shell id -u):$(shell id -g) --entrypoint /usr/local/bin/cleanup.sh -v $$PWD/build:/github/home $$image
	@echo "Making sure x86_64-unknown-linux-musl release was created" 
	@[ -d build/rustls/target/x86_64-unknown-linux-musl ] || exit 1


image: 
	@docker build .	

.PHONY:
clean:
	@rm -rf build

build/rustls:
	git clone https://github.com/ctz/rustls build/rustls