# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.15.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.15.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/harish.bohara/workspace/personal/rocks_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/harish.bohara/workspace/personal/rocks_test

# Include any dependencies generated for this target.
include CMakeFiles/simple_example.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/simple_example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/simple_example.dir/flags.make

CMakeFiles/simple_example.dir/my_db.cc.o: CMakeFiles/simple_example.dir/flags.make
CMakeFiles/simple_example.dir/my_db.cc.o: my_db.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/harish.bohara/workspace/personal/rocks_test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/simple_example.dir/my_db.cc.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/simple_example.dir/my_db.cc.o -c /Users/harish.bohara/workspace/personal/rocks_test/my_db.cc

CMakeFiles/simple_example.dir/my_db.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simple_example.dir/my_db.cc.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/harish.bohara/workspace/personal/rocks_test/my_db.cc > CMakeFiles/simple_example.dir/my_db.cc.i

CMakeFiles/simple_example.dir/my_db.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simple_example.dir/my_db.cc.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/harish.bohara/workspace/personal/rocks_test/my_db.cc -o CMakeFiles/simple_example.dir/my_db.cc.s

# Object files for target simple_example
simple_example_OBJECTS = \
"CMakeFiles/simple_example.dir/my_db.cc.o"

# External object files for target simple_example
simple_example_EXTERNAL_OBJECTS =

simple_example: CMakeFiles/simple_example.dir/my_db.cc.o
simple_example: CMakeFiles/simple_example.dir/build.make
simple_example: /usr/local/lib/librocksdb.dylib
simple_example: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/usr/lib/libz.tbd
simple_example: /Users/harish.bohara/workspace/personal/rocksdb/libz.a
simple_example: /Users/harish.bohara/workspace/personal/rocksdb/liblz4.a
simple_example: /Users/harish.bohara/workspace/personal/rocksdb/libsnappy.a
simple_example: /usr/lib/libbz2.dylib
simple_example: CMakeFiles/simple_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/harish.bohara/workspace/personal/rocks_test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable simple_example"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simple_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/simple_example.dir/build: simple_example

.PHONY : CMakeFiles/simple_example.dir/build

CMakeFiles/simple_example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/simple_example.dir/cmake_clean.cmake
.PHONY : CMakeFiles/simple_example.dir/clean

CMakeFiles/simple_example.dir/depend:
	cd /Users/harish.bohara/workspace/personal/rocks_test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/harish.bohara/workspace/personal/rocks_test /Users/harish.bohara/workspace/personal/rocks_test /Users/harish.bohara/workspace/personal/rocks_test /Users/harish.bohara/workspace/personal/rocks_test /Users/harish.bohara/workspace/personal/rocks_test/CMakeFiles/simple_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/simple_example.dir/depend
