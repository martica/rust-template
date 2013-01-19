PRODUCT_NAME = template

RUSTENV = RUST_LOG=rustc=1,::rt::backtrace
RUSTOPTS ?= -A non-implicitly-copyable-typarams
RUSTC ?= rustc
RUST = $(RUSTENV) $(RUSTC) $(RUSTOPTS)

dir_guard = @mkdir -p $(@D)

BIN = ./bin/$(PRODUCT_NAME)
TEST = ./bin/test-$(PRODUCT_NAME)
SOURCES = ./src/*.rs
CRATE = ./src/$(PRODUCT_NAME).rs

.PHONY: all run test clean

all: test run

run: $(BIN)
	$(BIN)
	
test: $(TEST)
	$(TEST)

$(TEST): $(SOURCES)
	$(dir_guard)
	$(RUST) $(OPTIONS) --test $(CRATE) -o $@

$(BIN): $(SOURCES)
	$(dir_guard)
	$(RUST) $(OPTIONS) $(CRATE) -o $@

clean:
	rm -rf bin
