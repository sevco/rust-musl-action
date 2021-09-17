test: IMAGE=$(shell docker build -q .) 
test: image build/rustls
	mkdir -p build/.cargo && echo '\n[registries.test]\nindex="https://test.test/test.git"' > build/.cargo/config
	echo "Building crate in container" && \
	docker run --rm --user $(shell id -u):$(shell id -g) -v $$PWD/build:/github/home $(IMAGE) "build --release" "rustls" 
	@echo "Making sure config was appended"
	@grep -q 'index="https://test.test/test.git"' build/.cargo/config || exit 1
	@echo "Running cleanup" 
	docker run --rm --user $(shell id -u):$(shell id -g) --entrypoint /usr/local/bin/cleanup.sh -v $$PWD/build:/github/home $(IMAGE)
	@echo "Making sure config was preserved"
	@grep -q 'index="https://test.test/test.git"' build/.cargo/config || exit 1
	@echo "Making sure x86_64-unknown-linux-musl release was created" 
	@[ -d build/rustls/target/x86_64-unknown-linux-musl ] || exit 1


image: 
	@docker build .	

.PHONY:
clean:
	@rm -rf build

build/rustls:
	git clone https://github.com/ctz/rustls build/rustls