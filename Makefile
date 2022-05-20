SYLT=sylt-lang/target/debug/sylt

OUTPUT=output
OUTPUT_FILE=$(OUTPUT)/main.lua

SY_MAIN=main.sy
SYLT_FILES=$(shell find . -iname "*.sy")
SYLT_COMPILER_FILES=$(shell find sylt-lang -iname "*.rs")
RES_FILES=$(shell find res/)

.PHONY: run clean sylt

run: $(OUTPUT_FILE)
	love $(OUTPUT)

clean: 
	rm -rf $(OUTPUT)

sylt: $(SYLT)

$(SYLT): $(SYLT_COMPILER_FILES)
	cd sylt-lang/ && cargo build

$(OUTPUT_FILE): $(SYLT_FILES) $(SYLT) $(RES_FILES)
	mkdir -p $(OUTPUT)
	cp -rf res $(OUTPUT)/res
	$(SYLT) --output $(OUTPUT_FILE) $(SY_MAIN)
	
