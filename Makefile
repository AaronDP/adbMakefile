#Sample makefile
NDK_USR_PATH 	:= $(NDK)
CWARNS          := -Wall -pedantic
CFLAGS          += $(CWARNS) -O3 
CFLAGS          += -fPIC -Bdynamic -Wl,--gc-section -Wl,-z,nocopyreloc -Wl,--no-undefined 
CFLAGS          += -Wl,--dynamic-linker=/system/bin/linker -Wl,-rpath-link=$(NDK_USR_PATH)/lib 
CFLAGS          += -nostdlib $(NDK_USR_PATH)/lib/crtend_android.o $(NDK_USR_PATH)/lib/crtbegin_dynamic.o 
CFLAGS          += -L$(NDK_USR_PATH)/lib
BINARY		:= ini_dump

SRC             := ini_dump.c ini.c
OBJ             := $(patsubst %.c, %.o, $(SRC))

all: $(BINARY)

$(BINARY): $(OBJ)
	$(CC) $(CFLAGS) -o $(BINARY) $(OBJ) -lc

install:
	echo Not installing
clean:
	$(RM) $(BINARY) *.o
