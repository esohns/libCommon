#find_package (Threads REQUIRED)

if (UNIX)
 pkg_check_modules (PKG_FFMPEG REQUIRED libavcodec libavformat libavutil)
endif (UNIX)

#message (STATUS "BUILD_PATH_SUFFIX: ${BUILD_PATH_SUFFIX}")
#message (STATUS "CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
#get_filename_component (BUILD_PATH ${CMAKE_CURRENT_BINARY_DIR}/../.. REALPATH DIRECTORY)
#get_filename_component (BUILD_PATH_SUFFIX ${BUILD_PATH} NAME)
#find_package (Common ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_MICRO}
#              REQUIRED COMPONENTS lib
#              CONFIG
#              PATHS ${CMAKE_CURRENT_SOURCE_DIR}/../modules ${CMAKE_CURRENT_SOURCE_DIR}/../../..
#              PATH_SUFFIXES Common/${BUILD_PATH_SUFFIX}
#              NO_DEFAULT_PATH)
#if (NOT EXISTS ${Common_DIR})
# message (FATAL_ERROR "could not find package \"Common\", aborting")
#endif ()

############## definitions ###############
#add_definitions (-DACE_HAS_DLL)
add_definitions (-DFFMPEG_SUPPORT)
add_definitions (-DHAVE_CONFIG_H)
#set_property (SOURCE PROPERTY COMPILE_DEFINITIONS HAVE_CONFIG_H)
#add_definitions (-DCOMMON_HAS_DLL)
#add_definitions (-DCOMMON_TIMER_HAS_DLL)

############## includes ###############

if (UNIX)
 include_directories (${PKG_FFMPEG_INCLUDE_DIRS})

 include_directories (${CMAKE_CURRENT_SOURCE_DIR}/../../modules/ACE)
elseif (WIN32)
 include_directories ($ENV{LIB_ROOT}/ffmpeg/include)
endif ()

include_directories (${CMAKE_CURRENT_SOURCE_DIR}/../../src)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/../../src/image)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/../../src/log)

include_directories (${CMAKE_CURRENT_SOURCE_DIR}/..)

include_directories (${CMAKE_CURRENT_BINARY_DIR}/..)

############## next target ###############
set (ffmpeg_EXE_SRCS
     test_i.cpp)

#cmake_policy (SET CMP0065 OLD) # do not add flags to export symbols from executables without the ENABLE_EXPORTS target property
set (EXECUTABLE ffmpeg)
add_executable (${EXECUTABLE}
                EXCLUDE_FROM_ALL
                ${ffmpeg_EXE_SRCS})
set_property (TARGET ${EXECUTABLE} PROPERTY FOLDER "test_i")

if (THREADS_HAVE_PTHREAD_ARG)
  set_property (TARGET ${EXECUTABLE} PROPERTY COMPILE_OPTIONS "-pthread")
  set_property (TARGET ${EXECUTABLE} PROPERTY INTERFACE_COMPILE_OPTIONS "-pthread")
endif ()

if (CMAKE_THREAD_LIBS_INIT)
 target_link_libraries (${EXECUTABLE} "${CMAKE_THREAD_LIBS_INIT}")
endif ()
if (UNIX)
 target_link_libraries (${EXECUTABLE} ${PKG_FFMPEG_LIBRARIES})
elseif (WIN32)
# target_link_libraries (${EXECUTABLE} $ENV{LIB_ROOT}/ffmpeg/libavcodec/avcodec.lib)
# target_link_libraries (${EXECUTABLE} $ENV{LIB_ROOT}/ffmpeg/libavformat/avformat.lib)
# target_link_libraries (${EXECUTABLE} $ENV{LIB_ROOT}/ffmpeg/libavutil/avutil.lib)
 target_link_libraries (${EXECUTABLE} $ENV{LIB_ROOT}/ffmpeg/lib/avcodec.lib)
 target_link_libraries (${EXECUTABLE} $ENV{LIB_ROOT}/ffmpeg/lib/avformat.lib)
 target_link_libraries (${EXECUTABLE} $ENV{LIB_ROOT}/ffmpeg/lib/avutil.lib)
endif ()

target_link_libraries (${EXECUTABLE} ${ACE_LIBRARY})

target_link_libraries (${EXECUTABLE} Common)
target_link_libraries (${EXECUTABLE} CommonImage)
target_link_libraries (${EXECUTABLE} CommonLog)
target_link_libraries (${EXECUTABLE} CommonTimer)

if (WIN32)
 set_target_properties (${EXECUTABLE} PROPERTIES LINK_FLAGS /SAFESEH:NO)
endif (WIN32)

# add PCH
#set_target_properties (${EXECUTABLE} PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT "stdafx.h")
#cotire (${EXECUTABLE})

############### installation #############
install (TARGETS ${EXECUTABLE}
         EXPORT ${PROJECT_NAME}Targets
         RUNTIME DESTINATION ${INSTALL_BIN_DIR} COMPONENT test_i)

################ launchers ###############
file (TO_CMAKE_PATH $ENV{LIB_ROOT}/ACE_TAO/ACE/lib ACE_LIB_PATH)
file (TO_CMAKE_PATH $ENV{LIB_ROOT}/ffmpeg/bin FFMPEG_LIB_PATH)
file (TO_CMAKE_PATH $ENV{LIB_ROOT}/ImageMagick IMAGEMAGICK_LIB_PATH)
create_target_launcher (${EXECUTABLE}
                        ARGS "-f oak-tree.png -t"
#                         FORWARD_ARGS
                        RUNTIME_LIBRARY_DIRS ${ACE_LIB_PATH}
                                             ${FFMPEG_LIB_PATH}
                                             ${IMAGEMAGICK_LIB_PATH}
                        WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/../test_i/ffmpeg
                        ENVIRONMENT foo=bar)

################ tests ###################
add_test (NAME ${EXECUTABLE}_test
          COMMAND ${PROJECT_BINARY_DIR}/${EXECUTABLE}
          WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
set_tests_properties (${EXECUTABLE}_test
                      PROPERTIES
                      ENVIRONMENT "PATH=D:\\projects\\ATCD\\ACE\\lib;D:\\projects\\gtk\\bin;D:\\projects\\libglade\\bin;D:\\projects\\libxml2-2.9.1\\.libs;G:\\software\\Development\\dll;${PROJECT_SOURCE_DIR}\\..\\libCommon\\cmake\\src\\Debug;${PROJECT_SOURCE_DIR}\\..\\libCommon\\cmake\\src\\ui\\Debug;${PROJECT_SOURCE_DIR}\\cmake\\src\\Debug;${PROJECT_SOURCE_DIR}\\cmake\\src\\modules\\dev\\Debug;${PROJECT_SOURCE_DIR}\\..\\libACENetwork\\cmake\\src\\Debug;%PATH%")
#PATH=%PATH%;$(ProjectDir)..\..\..\..\ATCD\ACE\lib;$(ProjectDir)..\..\..\..\gtk3\bin;$(ProjectDir)..\..\..\..\libav-11.7\libavcodec;$(ProjectDir)..\..\..\..\libav-11.7\libavresample;$(ProjectDir)..\..\..\..\libav-11.7\libavutil;$(ProjectDir)..\..\..\..\libCommon\cmake\src\Debug;$(ProjectDir)..\..\..\..\libCommon\cmake\src\err\Debug;$(ProjectDir)..\..\..\..\libCommon\cmake\src\ui\Debug;$(ProjectDir)..\..\src\Debug;$(ProjectDir)..\..\src\modules\dev\Debug;$(ProjectDir)..\..\src\modules\vis\Debug
