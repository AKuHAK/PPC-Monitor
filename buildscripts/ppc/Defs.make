PPC_TOOL_PREFIX ?= powerpc-ps2-eabi-
PPC_CC ?= $(PPC_TOOL_PREFIX)gcc
PPC_AS ?= $(PPC_TOOL_PREFIX)as
PPC_LD ?= $(PPC_TOOL_PREFIX)ld
PPC_AR ?= $(PPC_TOOL_PREFIX)ar
PPC_OBJCOPY ?= $(PPC_TOOL_PREFIX)objcopy
PPC_STRIP ?= $(PPC_TOOL_PREFIX)strip
PPC_ADDR2LINE ?= $(PPC_TOOL_PREFIX)addr2line
PPC_RANLIB ?= $(PPC_TOOL_PREFIX)ranlib

# Common:

MKDIR ?= mkdir
RMDIR ?= rmdir
ECHO ?= echo

#MAKEREC ?= $(MAKE) -C
