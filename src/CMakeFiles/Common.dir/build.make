# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/win_d/projects/libCommon

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/win_d/projects/libCommon

# Include any dependencies generated for this target.
include src/CMakeFiles/Common.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/Common.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/Common.dir/flags.make

src/cotire/Common_CXX_prefix.hxx.gch: src/cotire/Common_CXX_prefix.hxx
src/cotire/Common_CXX_prefix.hxx.gch: src/cotire/Common_CXX_prefix.hxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX precompiled header src/cotire/Common_CXX_prefix.hxx.gch"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Debug -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /mnt/win_d/projects/cotire/CMake/cotire.cmake precompile /mnt/win_d/projects/libCommon/src/Common_CXX_cotire.cmake /mnt/win_d/projects/libCommon/src/cotire/Common_CXX_prefix.hxx /mnt/win_d/projects/libCommon/src/cotire/Common_CXX_prefix.hxx.gch stdafx.cpp

src/cotire/Common_CXX_prefix.hxx: src/cotire/Common_CXX_prefix.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating CXX prefix header src/cotire/Common_CXX_prefix.hxx"
	/usr/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Debug -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /mnt/win_d/projects/cotire/CMake/cotire.cmake combine /mnt/win_d/projects/libCommon/src/Common_CXX_cotire.cmake /mnt/win_d/projects/libCommon/src/cotire/Common_CXX_prefix.hxx /mnt/win_d/projects/libCommon/src/cotire/Common_CXX_prefix.cxx

src/cotire/Common_CXX_prefix.cxx: src/stdafx.h
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating CXX prefix source src/cotire/Common_CXX_prefix.cxx"
	/usr/bin/cmake -DCOTIRE_BUILD_TYPE:STRING=Debug -DCOTIRE_VERBOSE:BOOL=$(VERBOSE) -P /mnt/win_d/projects/cotire/CMake/cotire.cmake combine /mnt/win_d/projects/libCommon/src/Common_CXX_cotire.cmake /mnt/win_d/projects/libCommon/src/cotire/Common_CXX_prefix.cxx /mnt/win_d/projects/libCommon/src/stdafx.h

src/CMakeFiles/Common.dir/stdafx.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/stdafx.cpp.o: src/stdafx.cpp
src/CMakeFiles/Common.dir/stdafx.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/Common.dir/stdafx.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/stdafx.cpp.o -c /mnt/win_d/projects/libCommon/src/stdafx.cpp

src/CMakeFiles/Common.dir/stdafx.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/stdafx.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/stdafx.cpp > CMakeFiles/Common.dir/stdafx.cpp.i

src/CMakeFiles/Common.dir/stdafx.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/stdafx.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/stdafx.cpp -o CMakeFiles/Common.dir/stdafx.cpp.s

src/CMakeFiles/Common.dir/stdafx.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/stdafx.cpp.o.requires

src/CMakeFiles/Common.dir/stdafx.cpp.o.provides: src/CMakeFiles/Common.dir/stdafx.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/stdafx.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/stdafx.cpp.o.provides

src/CMakeFiles/Common.dir/stdafx.cpp.o.provides.build: src/CMakeFiles/Common.dir/stdafx.cpp.o


src/CMakeFiles/Common.dir/common_file_tools.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_file_tools.cpp.o: src/common_file_tools.cpp
src/CMakeFiles/Common.dir/common_file_tools.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/Common.dir/common_file_tools.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_file_tools.cpp.o -c /mnt/win_d/projects/libCommon/src/common_file_tools.cpp

src/CMakeFiles/Common.dir/common_file_tools.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_file_tools.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_file_tools.cpp > CMakeFiles/Common.dir/common_file_tools.cpp.i

src/CMakeFiles/Common.dir/common_file_tools.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_file_tools.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_file_tools.cpp -o CMakeFiles/Common.dir/common_file_tools.cpp.s

src/CMakeFiles/Common.dir/common_file_tools.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_file_tools.cpp.o.requires

src/CMakeFiles/Common.dir/common_file_tools.cpp.o.provides: src/CMakeFiles/Common.dir/common_file_tools.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_file_tools.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_file_tools.cpp.o.provides

src/CMakeFiles/Common.dir/common_file_tools.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_file_tools.cpp.o


src/CMakeFiles/Common.dir/common_logger.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_logger.cpp.o: src/common_logger.cpp
src/CMakeFiles/Common.dir/common_logger.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/Common.dir/common_logger.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_logger.cpp.o -c /mnt/win_d/projects/libCommon/src/common_logger.cpp

src/CMakeFiles/Common.dir/common_logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_logger.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_logger.cpp > CMakeFiles/Common.dir/common_logger.cpp.i

src/CMakeFiles/Common.dir/common_logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_logger.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_logger.cpp -o CMakeFiles/Common.dir/common_logger.cpp.s

src/CMakeFiles/Common.dir/common_logger.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_logger.cpp.o.requires

src/CMakeFiles/Common.dir/common_logger.cpp.o.provides: src/CMakeFiles/Common.dir/common_logger.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_logger.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_logger.cpp.o.provides

src/CMakeFiles/Common.dir/common_logger.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_logger.cpp.o


src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o: src/common_referencecounter_base.cpp
src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_referencecounter_base.cpp.o -c /mnt/win_d/projects/libCommon/src/common_referencecounter_base.cpp

src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_referencecounter_base.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_referencecounter_base.cpp > CMakeFiles/Common.dir/common_referencecounter_base.cpp.i

src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_referencecounter_base.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_referencecounter_base.cpp -o CMakeFiles/Common.dir/common_referencecounter_base.cpp.s

src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.requires

src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.provides: src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.provides

src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o


src/CMakeFiles/Common.dir/common_signalhandler.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_signalhandler.cpp.o: src/common_signalhandler.cpp
src/CMakeFiles/Common.dir/common_signalhandler.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/CMakeFiles/Common.dir/common_signalhandler.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_signalhandler.cpp.o -c /mnt/win_d/projects/libCommon/src/common_signalhandler.cpp

src/CMakeFiles/Common.dir/common_signalhandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_signalhandler.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_signalhandler.cpp > CMakeFiles/Common.dir/common_signalhandler.cpp.i

src/CMakeFiles/Common.dir/common_signalhandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_signalhandler.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_signalhandler.cpp -o CMakeFiles/Common.dir/common_signalhandler.cpp.s

src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.requires

src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.provides: src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.provides

src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_signalhandler.cpp.o


src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o: src/common_statemachine_base.cpp
src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_statemachine_base.cpp.o -c /mnt/win_d/projects/libCommon/src/common_statemachine_base.cpp

src/CMakeFiles/Common.dir/common_statemachine_base.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_statemachine_base.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_statemachine_base.cpp > CMakeFiles/Common.dir/common_statemachine_base.cpp.i

src/CMakeFiles/Common.dir/common_statemachine_base.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_statemachine_base.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_statemachine_base.cpp -o CMakeFiles/Common.dir/common_statemachine_base.cpp.s

src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.requires

src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.provides: src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.provides

src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o


src/CMakeFiles/Common.dir/common_task_base.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_task_base.cpp.o: src/common_task_base.cpp
src/CMakeFiles/Common.dir/common_task_base.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/CMakeFiles/Common.dir/common_task_base.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_task_base.cpp.o -c /mnt/win_d/projects/libCommon/src/common_task_base.cpp

src/CMakeFiles/Common.dir/common_task_base.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_task_base.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_task_base.cpp > CMakeFiles/Common.dir/common_task_base.cpp.i

src/CMakeFiles/Common.dir/common_task_base.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_task_base.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_task_base.cpp -o CMakeFiles/Common.dir/common_task_base.cpp.s

src/CMakeFiles/Common.dir/common_task_base.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_task_base.cpp.o.requires

src/CMakeFiles/Common.dir/common_task_base.cpp.o.provides: src/CMakeFiles/Common.dir/common_task_base.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_task_base.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_task_base.cpp.o.provides

src/CMakeFiles/Common.dir/common_task_base.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_task_base.cpp.o


src/CMakeFiles/Common.dir/common_timerhandler.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_timerhandler.cpp.o: src/common_timerhandler.cpp
src/CMakeFiles/Common.dir/common_timerhandler.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/CMakeFiles/Common.dir/common_timerhandler.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_timerhandler.cpp.o -c /mnt/win_d/projects/libCommon/src/common_timerhandler.cpp

src/CMakeFiles/Common.dir/common_timerhandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_timerhandler.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_timerhandler.cpp > CMakeFiles/Common.dir/common_timerhandler.cpp.i

src/CMakeFiles/Common.dir/common_timerhandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_timerhandler.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_timerhandler.cpp -o CMakeFiles/Common.dir/common_timerhandler.cpp.s

src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.requires

src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.provides: src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.provides

src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_timerhandler.cpp.o


src/CMakeFiles/Common.dir/common_timer_manager.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_timer_manager.cpp.o: src/common_timer_manager.cpp
src/CMakeFiles/Common.dir/common_timer_manager.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/CMakeFiles/Common.dir/common_timer_manager.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_timer_manager.cpp.o -c /mnt/win_d/projects/libCommon/src/common_timer_manager.cpp

src/CMakeFiles/Common.dir/common_timer_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_timer_manager.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_timer_manager.cpp > CMakeFiles/Common.dir/common_timer_manager.cpp.i

src/CMakeFiles/Common.dir/common_timer_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_timer_manager.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_timer_manager.cpp -o CMakeFiles/Common.dir/common_timer_manager.cpp.s

src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.requires

src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.provides: src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.provides

src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_timer_manager.cpp.o


src/CMakeFiles/Common.dir/common_tools.cpp.o: src/CMakeFiles/Common.dir/flags.make
src/CMakeFiles/Common.dir/common_tools.cpp.o: src/common_tools.cpp
src/CMakeFiles/Common.dir/common_tools.cpp.o: src/cotire/Common_CXX_prefix.hxx.gch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object src/CMakeFiles/Common.dir/common_tools.cpp.o"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Common.dir/common_tools.cpp.o -c /mnt/win_d/projects/libCommon/src/common_tools.cpp

src/CMakeFiles/Common.dir/common_tools.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Common.dir/common_tools.cpp.i"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/win_d/projects/libCommon/src/common_tools.cpp > CMakeFiles/Common.dir/common_tools.cpp.i

src/CMakeFiles/Common.dir/common_tools.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Common.dir/common_tools.cpp.s"
	cd /mnt/win_d/projects/libCommon/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/win_d/projects/libCommon/src/common_tools.cpp -o CMakeFiles/Common.dir/common_tools.cpp.s

src/CMakeFiles/Common.dir/common_tools.cpp.o.requires:

.PHONY : src/CMakeFiles/Common.dir/common_tools.cpp.o.requires

src/CMakeFiles/Common.dir/common_tools.cpp.o.provides: src/CMakeFiles/Common.dir/common_tools.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/Common.dir/build.make src/CMakeFiles/Common.dir/common_tools.cpp.o.provides.build
.PHONY : src/CMakeFiles/Common.dir/common_tools.cpp.o.provides

src/CMakeFiles/Common.dir/common_tools.cpp.o.provides.build: src/CMakeFiles/Common.dir/common_tools.cpp.o


# Object files for target Common
Common_OBJECTS = \
"CMakeFiles/Common.dir/stdafx.cpp.o" \
"CMakeFiles/Common.dir/common_file_tools.cpp.o" \
"CMakeFiles/Common.dir/common_logger.cpp.o" \
"CMakeFiles/Common.dir/common_referencecounter_base.cpp.o" \
"CMakeFiles/Common.dir/common_signalhandler.cpp.o" \
"CMakeFiles/Common.dir/common_statemachine_base.cpp.o" \
"CMakeFiles/Common.dir/common_task_base.cpp.o" \
"CMakeFiles/Common.dir/common_timerhandler.cpp.o" \
"CMakeFiles/Common.dir/common_timer_manager.cpp.o" \
"CMakeFiles/Common.dir/common_tools.cpp.o"

# External object files for target Common
Common_EXTERNAL_OBJECTS =

src/libCommon.a: src/CMakeFiles/Common.dir/stdafx.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_file_tools.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_logger.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_signalhandler.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_task_base.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_timerhandler.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_timer_manager.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/common_tools.cpp.o
src/libCommon.a: src/CMakeFiles/Common.dir/build.make
src/libCommon.a: src/CMakeFiles/Common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/win_d/projects/libCommon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX static library libCommon.a"
	cd /mnt/win_d/projects/libCommon/src && $(CMAKE_COMMAND) -P CMakeFiles/Common.dir/cmake_clean_target.cmake
	cd /mnt/win_d/projects/libCommon/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/Common.dir/build: src/libCommon.a

.PHONY : src/CMakeFiles/Common.dir/build

src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/stdafx.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_file_tools.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_logger.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_referencecounter_base.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_signalhandler.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_statemachine_base.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_task_base.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_timerhandler.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_timer_manager.cpp.o.requires
src/CMakeFiles/Common.dir/requires: src/CMakeFiles/Common.dir/common_tools.cpp.o.requires

.PHONY : src/CMakeFiles/Common.dir/requires

src/CMakeFiles/Common.dir/clean:
	cd /mnt/win_d/projects/libCommon/src && $(CMAKE_COMMAND) -P CMakeFiles/Common.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/Common.dir/clean

src/CMakeFiles/Common.dir/depend: src/cotire/Common_CXX_prefix.hxx.gch
src/CMakeFiles/Common.dir/depend: src/cotire/Common_CXX_prefix.hxx
src/CMakeFiles/Common.dir/depend: src/cotire/Common_CXX_prefix.cxx
	cd /mnt/win_d/projects/libCommon && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/win_d/projects/libCommon /mnt/win_d/projects/libCommon/src /mnt/win_d/projects/libCommon /mnt/win_d/projects/libCommon/src /mnt/win_d/projects/libCommon/src/CMakeFiles/Common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/Common.dir/depend
