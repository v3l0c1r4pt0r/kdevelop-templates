ifdef TOOLCHAIN
# if user defines toolchains location it will pick compiler from there
CC	:= $(TOOLCHAIN)/xtensa-lx106-elf-gcc
AR	:= $(TOOLCHAIN)/xtensa-lx106-elf-ar
LD	:= $(TOOLCHAIN)/xtensa-lx106-elf-gcc
else
# otherwise it will pick them from $PATH
CC	= xtensa-lx106-elf-gcc
AR	= xtensa-lx106-elf-ar
LD	= xtensa-lx106-elf-gcc
endif

# allow adding custom flags
CFLAGS?=
LDFLAGS?=

# default configuration, do not modify unless you know what you are doing
EXTRA_CFLAGS	= -Os -g -O2 -Wpointer-arith -Wundef -Werror -Wl,-EL -fno-inline-functions -nostdlib -mlongcalls -mtext-section-literals  -D__ets__ -DICACHE_FLASH
EXTRA_LDFLAGS	= -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static
EXTRA_LIBS	= gcc pp phy net80211 lwip wpa main
LD_SCRIPT	= eagle.app.v6.ld

# customizations
CFLAGS		+= $(EXTRA_CFLAGS)
LDFLAGS		+= $(EXTRA_LDFLAGS)
LIBS		:= $(EXTRA_LIBS)

# defaults
SDK		?= /opt/Espressif/ESP8266_SDK
ESPTOOL		?= esptool.py
TTY		?= /dev/ttyUSB0

# locations inside spi flash
IRAM1_ADDR	= 0x00000
IROM0_ADDR	= 0x40000

# sdk paths
SDK_INCLUDE	:= $(SDK)/include
SDK_LIB		:= $(SDK)/lib
SDK_LD		:= $(SDK)/ld

# sdk includes, libs and ld scripts
CFLAGS		+= $(addprefix -I, $(SDK_INCLUDE)) -I.
LDFLAGS		+= $(addprefix -L, $(SDK_LIB))
LDFLAGS		+= $(addprefix -T, $(SDK_LD))/$(LD_SCRIPT)
LIBS		:= $(addprefix -l,$(LIBS))

# firmware
FWDIR		:= firmware
IRAM1FW		:= $(FWDIR)/$(IRAM1_ADDR).bin
IROM0FW		:= $(FWDIR)/$(IROM0_ADDR).bin

# elf output name
OUTFILE		:= %{APPNAMELC}

# sources to include in project
SRC		:= $(wildcard *.c)
OBJ		:= $(SRC:.c=.o)

all: elf
elf: $(OBJ) $(OUTFILE)
fw: $(OBJ) $(OUTFILE) $(IRAM1FW) $(IROM0FW)
flash: fw
	$(ESPTOOL) --port $(TTY) write_flash $(IRAM1_ADDR) $(IRAM1FW) $(IROM0_ADDR) $(IROM0FW)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
$(OUTFILE):
	$(LD) $(LDFLAGS) -Wl,--start-group $(LIBS) $(OBJ) -Wl,--end-group -o $@
$(FWDIR):
	mkdir -p $@
$(FWDIR)/%.bin: $(FWDIR)
	$(ESPTOOL) elf2image -o $(FWDIR)/ $(OUTFILE)
clean:
	rm -vfr $(FWDIR) $(OBJ) $(OUTFILE)
