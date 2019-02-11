# Define compiler
#CC = qcc
CC = gmqcc

# compiler flags:
#
#  -O<level> - Specfies the optimization level: highest being 3, lowest being
#              0 (no optimization)
#  -g        - Enables generation of debug info for engine backtraces
#  -E        - Instructs the compiler to only preprocess the input, writing the
#              preprocessed output to stdout
#  -D        - "define" a macro. Optionally you may supply a value to the macro
#              with "=". Implicitally turns on -fftepp
#  -Wall     - Enables all compiled warnings for the selcted standard
#  -Werror   - Instruct the compiler to treat all warnings as errors
#  -std=     - Selects the standard dialect:
#                gmqcc  - standard
#                fteqcc - fteqcc standard
#                   qcc - vanila QuakeC standard
#
CFLAGS  = -O2 -Wall -std=qcc

# the build target executable:
TARGET = progs

all: $(TARGET)

$(TARGET):
	cd ./src; \
		$(CC) $(CFLAGS) -o $(TARGET).dat -s ./$(TARGET).src; \
		cd ..; \
		mv ./src/$(TARGET).dat ./

#$(TARGET):
#	cd ./src; \
#		$(CC); \
#		cd ..

clean:
	rm $(TARGET).dat; \
		rm src/progdefs.h
