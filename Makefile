SYLT=sylt-lang/target/debug/sylt

OUTPUT=output
OUTPUT_FILE=$(OUTPUT)/main.lua

SY_MAIN=main.sy
SYLT_FILES=$(shell find . -iname "*.sy")
SYLT_COMPILER_FILES=$(shell find sylt-lang -iname "*.rs")

.PHONY: run clean sylt

run: $(OUTPUT_FILE)
	love $(OUTPUT)

clean: 
	rm -rf $(OUTPUT)

sylt: $(SYLT)

$(SYLT): $(SYLT_COMPILER_FILES)
	cd sylt-lang/ && cargo build

$(OUTPUT_FILE): $(SYLT_FILES) $(SYLT)
	mkdir -p $(OUTPUT)
	$(SYLT) --output $(OUTPUT_FILE) $(SY_MAIN)
	
