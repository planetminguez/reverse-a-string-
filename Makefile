
###############################################################################
#                         STRING REVERSAL PROGRAM
#                              GNU MAKEFILE
###############################################################################
#
# This Makefile builds the C program:
#
#     reverse.c
#
# into the executable:
#
#     reverse
#
# Supported targets:
#
#     make          - Compile the program
#     make all      - Compile the program
#     make clean    - Remove compiled files
#     make rebuild  - Clean and compile from scratch
#     make debug    - Build with debugging information
#     make run      - Build and run the program
#
###############################################################################


###############################################################################
# COMPILER
###############################################################################

# C compiler to use.
#
# GCC is used here, but this can be changed to clang if desired:
#
#     CC = clang
#
CC = gcc


###############################################################################
# PROGRAM NAME
###############################################################################

# Name of the final executable.
#
TARGET = reverse


###############################################################################
# SOURCE FILES
###############################################################################

# C source files used by the program.
#
SRCS = reverse.c


###############################################################################
# OBJECT FILES
###############################################################################

# Convert every .c source file in SRCS into a corresponding .o object file.
#
# Example:
#
#     reverse.c
#
# becomes:
#
#     reverse.o
#
OBJS = $(SRCS:.c=.o)


###############################################################################
# COMPILER FLAGS
###############################################################################

# C language standard.
#
# C11 provides modern C language features while remaining widely supported.
#
CSTD = -std=c11


# Warning options.
#
# These options make GCC report potential programming mistakes.
#
WARNINGS = -Wall \
           -Wextra \
           -Wpedantic \
           -Wconversion \
           -Wsign-conversion \
           -Wshadow \
           -Wformat=2


# Optimization level.
#
# -O2 provides a good balance between performance and compilation time.
#
OPTIMIZATION = -O2


# Combine all compiler flags.
#
CFLAGS = $(CSTD) $(WARNINGS) $(OPTIMIZATION)


###############################################################################
# LINKER FLAGS
###############################################################################

# Linker flags.
#
# There are currently no special libraries required by this program.
#
LDFLAGS =


###############################################################################
# LIBRARIES
###############################################################################

# External libraries.
#
# The program uses only the standard C library, so no additional libraries
# are required.
#
LDLIBS =


###############################################################################
# DEFAULT TARGET
###############################################################################

# The first target in a Makefile is normally the default target.
#
# Therefore:
#
#     make
#
# is equivalent to:
#
#     make all
#
.PHONY: all
all: $(TARGET)


###############################################################################
# LINK THE FINAL EXECUTABLE
###############################################################################

# Build the executable from the object files.
#
# The automatic variables mean:
#
#     $@
#         Name of the target being created.
#
#     $^
#         All prerequisites.
#
$(TARGET): $(OBJS)
	@echo "=========================================="
	@echo " Linking executable: $(TARGET)"
	@echo "=========================================="
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
	@echo ""
	@echo "Build complete!"
	@echo "Executable: ./$(TARGET)"
	@echo ""


###############################################################################
# COMPILE C SOURCE FILES
###############################################################################

# Compile each .c file into an object file.
#
# The -c option tells GCC to compile the source file without linking.
#
# The object file can then be linked into the final executable.
#
%.o: %.c
	@echo "------------------------------------------"
	@echo " Compiling: $<"
	@echo "------------------------------------------"
	$(CC) $(CFLAGS) -c $< -o $@


###############################################################################
# RUN THE PROGRAM
###############################################################################

# Build the program and then execute it.
#
# Usage:
#
#     make run
#
.PHONY: run
run: $(TARGET)
	@echo "=========================================="
	@echo " Running $(TARGET)"
	@echo "=========================================="
	./$(TARGET)


###############################################################################
# DEBUG BUILD
###############################################################################

# Build a version containing debugging information.
#
# -g
#     Adds debugging information for GDB.
#
# -O0
#     Disables optimization, making debugging easier.
#
.PHONY: debug
debug:
	@echo "=========================================="
	@echo " Building DEBUG version"
	@echo "=========================================="
	$(CC) $(CSTD) $(WARNINGS) -O0 -g $(SRCS) -o $(TARGET)
	@echo ""
	@echo "Debug build complete."
	@echo "Start GDB with:"
	@echo ""
	@echo "    gdb ./$(TARGET)"
	@echo ""


###############################################################################
# CLEAN
###############################################################################

# Remove all generated object files and the executable.
#
# Usage:
#
#     make clean
#
.PHONY: clean
clean:
	@echo "=========================================="
	@echo " Cleaning build files"
	@echo "=========================================="
	rm -f $(OBJS)
	rm -f $(TARGET)
	@echo "Clean complete."
	@echo ""


###############################################################################
# REBUILD
###############################################################################

# Completely remove the previous build and compile everything again.
#
# Usage:
#
#     make rebuild
#
.PHONY: rebuild
rebuild: clean all


###############################################################################
# SHOW CONFIGURATION
###############################################################################

# Display the current Makefile configuration.
#
# Usage:
#
#     make info
#
.PHONY: info
info:
	@echo "=========================================="
	@echo " Build Configuration"
	@echo "=========================================="
	@echo "Compiler:       $(CC)"
	@echo "C Standard:     $(CSTD)"
	@echo "Warnings:       $(WARNINGS)"
	@echo "Optimization:   $(OPTIMIZATION)"
	@echo "Source files:   $(SRCS)"
	@echo "Object files:   $(OBJS)"
	@echo "Executable:     $(TARGET)"
	@echo "=========================================="


###############################################################################
# HELP
###############################################################################

# Display available Makefile commands.
#
# Usage:
#
#     make help
#
.PHONY: help
help:
	@echo ""
	@echo "String Reversal Program - Makefile Commands"
	@echo ""
	@echo "  make          Build the program"
	@echo "  make all      Build the program"
	@echo "  make run      Build and run the program"
	@echo "  make debug    Build with GDB debugging support"
	@echo "  make clean    Remove compiled files"
	@echo "  make rebuild  Clean and rebuild everything"
	@echo "  make info     Display build configuration"
	@echo "  make help     Display this help message"
	@echo ""

