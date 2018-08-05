# enable pkg-config support
if (DEFINED ${PKG_CONFIG_EXECUTABLE})
else ()
# message (STATUS "setting PKG_CONFIG_EXECUTABLE...")
 if (DEFINED ENV{PKG_CONFIG_EXECUTABLE})
  set (PKG_CONFIG_EXECUTABLE $ENV{PKG_CONFIG_EXECUTABLE})
 else ()
  message (STATUS "PKG_CONFIG_EXECUTABLE not defined, falling back")
  if (UNIX)
   set (PKG_CONFIG_EXECUTABLE "/usr/bin/pkg-config")
  elseif (WIN32)
   set (PKG_CONFIG_EXECUTABLE "D:/temp/bin/pkg-config.exe")
  endif ()
 endif (DEFINED ENV{PKG_CONFIG_EXECUTABLE})
endif (DEFINED ${PKG_CONFIG_EXECUTABLE})
if (NOT EXISTS ${PKG_CONFIG_EXECUTABLE})
 message (STATUS "PKG_CONFIG_EXECUTABLE does not exist (was: \"${PKG_CONFIG_EXECUTABLE}\", continuing")
endif ()
