PRODUCT_NAME = template

RUSTENV = RUST_LOG=rustc=1,::rt::backtrace
RUSTOPTS ?= 
RUSTC ?= rustc
RUST = $(RUSTENV) $(RUSTC) $(RUSTOPTS)

dir_guard = @mkdir -p $(@D)

BIN = ./bin/$(PRODUCT_NAME)
TEST = ./bin/test-$(PRODUCT_NAME)
SOURCES = $(shell find ./src -name "*.r[sc]")
CRATE = ./src/$(PRODUCT_NAME).rc

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
