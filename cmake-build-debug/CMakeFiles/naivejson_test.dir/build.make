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
include CMakeFiles/naivejson_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/naivejson_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/naivejson_test.dir/flags.make

CMakeFiles/naivejson_test.dir/test.c.o: CMakeFiles/naivejson_test.dir/flags.make
CMakeFiles/naivejson_test.dir/test.c.o: ../test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/naivejson_test.dir/test.c.o"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/naivejson_test.dir/test.c.o   -c /Users/hashibami/Desktop/2018/编译原理/json_parser/test.c

CMakeFiles/naivejson_test.dir/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/naivejson_test.dir/test.c.i"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/hashibami/Desktop/2018/编译原理/json_parser/test.c > CMakeFiles/naivejson_test.dir/test.c.i

CMakeFiles/naivejson_test.dir/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/naivejson_test.dir/test.c.s"
	/Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/hashibami/Desktop/2018/编译原理/json_parser/test.c -o CMakeFiles/naivejson_test.dir/test.c.s

CMakeFiles/naivejson_test.dir/test.c.o.requires:

.PHONY : CMakeFiles/naivejson_test.dir/test.c.o.requires

CMakeFiles/naivejson_test.dir/test.c.o.provides: CMakeFiles/naivejson_test.dir/test.c.o.requires
	$(MAKE) -f CMakeFiles/naivejson_test.dir/build.make CMakeFiles/naivejson_test.dir/test.c.o.provides.build
.PHONY : CMakeFiles/naivejson_test.dir/test.c.o.provides

CMakeFiles/naivejson_test.dir/test.c.o.provides.build: CMakeFiles/naivejson_test.dir/test.c.o


# Object files for target naivejson_test
naivejson_test_OBJECTS = \
"CMakeFiles/naivejson_test.dir/test.c.o"

# External object files for target naivejson_test
naivejson_test_EXTERNAL_OBJECTS =

naivejson_test: CMakeFiles/naivejson_test.dir/test.c.o
naivejson_test: CMakeFiles/naivejson_test.dir/build.make
naivejson_test: libnaivejson.a
naivejson_test: CMakeFiles/naivejson_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable naivejson_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/naivejson_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/naivejson_test.dir/build: naivejson_test

.PHONY : CMakeFiles/naivejson_test.dir/build

CMakeFiles/naivejson_test.dir/requires: CMakeFiles/naivejson_test.dir/test.c.o.requires

.PHONY : CMakeFiles/naivejson_test.dir/requires

CMakeFiles/naivejson_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/naivejson_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/naivejson_test.dir/clean

CMakeFiles/naivejson_test.dir/depend:
	cd /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/hashibami/Desktop/2018/编译原理/json_parser /Users/hashibami/Desktop/2018/编译原理/json_parser /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug /Users/hashibami/Desktop/2018/编译原理/json_parser/cmake-build-debug/CMakeFiles/naivejson_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/naivejson_test.dir/depend
