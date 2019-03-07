if (UNIX)
# find_package (LibXml2 MODULE)
# if (LIBXML2_FOUND)
#  set (LIBXML2_SUPPORT ON CACHE BOOL "libxml2 support")
#  add_definitions (-DLIBXML2_SUPPORT)
# endif (LIBXML2_FOUND)
elseif (WIN32)
 set (MSXML_FOUND ON CACHE BOOL "MSXML found")
 set (MSXML_SUPPORT ON CACHE BOOL "MSXML support")
 add_definitions (-DMSXML_SUPPORT)
 # *TODO*: repair pkgconfig support on this platform
 set (PC_LIBXML_INCLUDE_DIRS "${CMAKE_SOURCE_DIR}/../libxml2/include")
 set (PC_LIBXML_LIBRARY_DIRS "${CMAKE_SOURCE_DIR}/../libxml2/win32/bin.msvc")
# message (STATUS "PC_LIBXML_INCLUDEDIR: ${PC_LIBXML_INCLUDEDIR}")
endif ()
find_package (LibXml2 MODULE)
if (LIBXML2_FOUND)
 set (LIBXML2_SUPPORT ON CACHE BOOL "libxml2 support")
 add_definitions (-DLIBXML2_SUPPORT)
endif (LIBXML2_FOUND)
