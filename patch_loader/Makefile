BUILD_SCRIPTS := $(abspath $(CURDIR)/../buildscripts)
PATCH_DIR := $(abspath $(CURDIR)/../patch)

EE_ASM_DIR = embed/
EE_SRC_DIR = src/
EE_OBJS_DIR = obj/
EE_BIN = bin/patch_loader_unc.elf
EE_BIN_PKD = bin/PPC-Monitor_Loader.ELF
EE_OBJS = $(addprefix obj/, patch_loader.o patch.o)

NEWLIB_NANO = 1
EE_LIBS += -ldebug
EE_LDFLAGS += -Wl,-zmax-page-size=128

BIN2C= $(PS2SDK)/bin/bin2c
#prep patch before building patch_loader
all: $(EE_BIN_PKD)
	$(MAKE) $(EE_BIN)

clean::
	rm -rf obj
	rm -rf embed
	rm -f *.map
	rm -f $(EE_BIN) $(EE_BIN_PKD) $(EE_SRC_DIR)patch.c

$(EE_BIN_PKD): $(EE_BIN)
	ps2-packer $< $@

$(PATCH_DIR)/bin/patch.bin: $(PATCH_DIR)/bin/patch.elf
	$(PPC_TOOL_PREFIX)objcopy -O binary $< $@

$(EE_SRC_DIR)patch.c: $(PATCH_DIR)/bin/patch.bin
	$(BIN2C) $< $@ patch_bin

$(EE_OBJS_DIR)%.o: $(EE_SRC_DIR)%.c
	$(DIR_GUARD)
	$(EE_CC) $(EE_CFLAGS) $(EE_INCS) -c $< -o $@

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
include $(BUILD_SCRIPTS)/ppc/Defs.make
