# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/hashibami/Desktop/2018/编译原理/json_parser

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/naivejson.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/naivejson.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/naivejson.dir/flags.make

CMakeFiles/naivejson.dir/naivejson.c.o: CMakeFiles/naivejson.dir/flags.make
CMakeFiles/naivejson.dir/naivejson.c.o: ../naivejson.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/naivejson.dir/naivejson.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/naivejson.dir/naivejson.c.o   -c /Users/hashibami/Desktop/2018/编译原理/json_parser/naivejson.c

CMakeFiles/naivejson.dir/naivejson.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/naivejson.dir/naivejson.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/hashibami/Desktop/2018/编译原理/json_parser/naivejson.c > CMakeFiles/naivejson.dir/naivejson.c.i

CMakeFiles/naivejson.dir/naivejson.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/naivejson.dir/naivejson.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/hashibami/Desktop/2018/编译原理/json_parser/naivejson.c -o CMakeFiles/naivejson.dir/naivejson.c.s

CMakeFiles/naivejson.dir/naivejson.c.o.requires:

.PHONY : CMakeFiles/naivejson.dir/naivejson.c.o.requires

CMakeFiles/naivejson.dir/naivejson.c.o.provides: CMakeFiles/naivejson.dir/naivejson.c.o.requires
	$(MAKE) -f CMakeFiles/naivejson.dir/build.make CMakeFiles/naivejson.dir/naivejson.c.o.provides.build
.PHONY : CMakeFiles/naivejson.dir/naivejson.c.o.provides

CMakeFiles/naivejson.dir/naivejson.c.o.provides.build: CMakeFiles/naivejson.dir/naivejson.c.o


# Object files for target naivejson
naivejson_OBJECTS = \
"CMakeFiles/naivejson.dir/naivejson.c.o"

# External object files for target naivejson
naivejson_EXTERNAL_OBJECTS =

libnaivejson.a: CMakeFiles/naivejson.dir/naivejson.c.o
libnaivejson.a: CMakeFiles/naivejson.dir/build.make
libnaivejson.a: CMakeFiles/naivejson.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libnaivejson.a"
	$(CMAKE_COMMAND) -P CMakeFiles/naivejson.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/naivejson.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/naivejson.dir/build: libnaivejson.a

.PHONY : CMakeFiles/naivejson.dir/build

CMakeFiles/naivejson.dir/requires: CMakeFiles/naivejson.dir/naivejson.c.o.requires

.PHONY : CMakeFiles/naivejson.dir/requires

CMakeFiles/naivejson.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/naivejson.dir/cmake_clean.cmake
.PHONY : CMakeFiles/naivejson.dir/clean

CMakeFiles/naivejson.dir/depend:
	cd /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/hashibami/Desktop/2018/编译原理/json_parser /Users/hashibami/Desktop/2018/编译原理/json_parser /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug/CMakeFiles/naivejson.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/naivejson.dir/depend

