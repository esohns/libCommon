if (UNIX)
# set (OpenGL_Components "OpenGL EGL GLX")
 set (OpenGL_Components "OpenGL")
elseif (WIN32)
 set (OpenGL_Components "OpenGL")
endif ()
find_package (OpenGL MODULE
              COMPONENTS ${OpenGL_Components})
if (OPENGL_FOUND)
 set (OPENGL_SUPPORT ON CACHE BOOL "OpenGL support")
 add_definitions (-DOPENGL_SUPPORT)
endif (OPENGL_FOUND)
# *TODO*
if (WIN32)
 set (OPENGL_SUPPORT ON CACHE BOOL "OpenGL support")
 add_definitions (-DOPENGL_SUPPORT)
endif (WIN32)

##########################################

if (UNIX)
# *NOTE*: prefer find_package() over pkg_check_modules()
 find_package (GTK3 MODULE)
 if (NOT GTK3_FOUND)
  find_package (GTK2 MODULE)
  if (NOT GTK2_FOUND)
   find_package (GTK MODULE)
   if (NOT GTK_FOUND)
    message (WARNING "find_package failed to detect GTK, falling back")
   else ()
    set (GTK_SUPPORT ON CACHE BOOL "GTK support")
    add_definitions (-DGTK_SUPPORT)
   endif (NOT GTK_FOUND)
  else ()
   set (GTK_SUPPORT ON CACHE BOOL "GTK support")
   add_definitions (-DGTK_SUPPORT)
   set (GTK2_SUPPORT ON CACHE BOOL "GTK2 support")
   add_definitions (-DGTK2_SUPPORT)
  endif (NOT GTK2_FOUND)

# *NOTE*: early versions of gtk do not support GtkBuilder
# *TODO*: --> find the version number(s) and auto-enable this feature for these
#             target systems
# *TODO*: retrieve the available gtk version number(s) from the pkg-config
#         output and pre-set this option accordingly
  pkg_check_modules (PKG_GLADE libglade-2.0)
  if (PKG_GLADE_FOUND)
   set (LIBGLADE_SUPPORT ON CACHE BOOL "libglade support")
   add_definitions (-DLIBGLADE_SUPPORT)
   option (LIBGLADE_SUPPORT "enable libglade support" OFF)
  endif (PKG_GLADE_FOUND)
  set (LIBGLADE_USE OFF CACHE BOOL "use libglade")
 else ()
  set (GTK_SUPPORT ON CACHE BOOL "GTK support")
  add_definitions (-DGTK_SUPPORT)
  set (GTK3_SUPPORT ON CACHE BOOL "GTK3 support")
  add_definitions (-DGTK3_SUPPORT)
 endif (NOT GTK3_FOUND)

 if (NOT GTK_FOUND AND NOT GTK2_FOUND)
  pkg_check_modules (PKG_GTK2 gmodule-2.0 gthread-2.0 gtk+-2.0)
  if (PKG_GTK2_FOUND)
   set (GTK_SUPPORT ON CACHE BOOL "GTK support")
   add_definitions (-DGTK_SUPPORT)
   set (GTK2_SUPPORT ON CACHE BOOL "GTK2 support")
   add_definitions (-DGTK2_SUPPORT)
  endif (PKG_GTK2_FOUND)

  pkg_check_modules (PKG_GTK3 gtk+-3.0)
  if (PKG_GTK3_FOUND)
   set (GTK_SUPPORT ON CACHE BOOL "GTK support")
   add_definitions (-DGTK_SUPPORT)
   set (GTK3_SUPPORT ON CACHE BOOL "GTK3 support")
   add_definitions (-DGTK3_SUPPORT)
# *TODO*: this is broken; PKG_GTK3_CFLAGS and PKG_GTK3_INCLUDE_DIRS are not set;
#         only PKG_GTK3_LIBRARIES is
#   message (STATUS "PKG_GTK3_CFLAGS: ${PKG_GTK3_CFLAGS}")
#   message (STATUS "PKG_GTK3_INCLUDE_DIRS: ${PKG_GTK3_INCLUDE_DIRS}")
#   message (STATUS "PKG_GTK3_LIBRARIES: ${PKG_GTK3_LIBRARIES}")
   set (pkgconfig_cmd "pkg-config")
   set (pkgconfig_arg "gtk+-3.0")
   unset (PKG_GTK3_INCLUDE_DIRS)
   unset (PKG_GTK3_ERROR)
   unset (PKG_GTK3_RESULT)
# *TODO*: this is totally broken; ('--libs' works, but '--cflags'|'--cflags-only-I' do not)
#   execute_process (COMMAND ${pkgconfig_cmd} --cflags-only-I ${pkgconfig_arg}
#                    RESULT_VARIABLE PKG_GTK3_RESULT
#                    OUTPUT_VARIABLE PKG_GTK3_INCLUDE_DIRS
#                    ERROR_VARIABLE PKG_GTK3_ERROR
#                    OUTPUT_STRIP_TRAILING_WHITESPACE)
#   exec_program (${pkgconfig_cmd}
#                 ARGS --cflags-only-I ${pkgconfig_arg}
#                 OUTPUT_VARIABLE PKG_GTK3_INCLUDE_DIRS
#                 RETURN_VALUE PKG_GTK3_RESULT)
#   if (NOT ${PKG_GTK3_RESULT} EQUAL 0)
#    message (FATAL_ERROR "Command \"pkg-config --cflags-only-I gtk+-3.0\" failed with output:\n${PKG_GTK3_ERROR}\n${PKG_GTK3_RESULT}, aborting")
#    message (FATAL_ERROR "Command \"pkg-config --cflags-only-I gtk+-3.0\" failed with output:\n${PKG_GTK3_INCLUDE_DIRS}\n${PKG_GTK3_RESULT}, aborting")
#   endif (NOT ${PKG_GTK3_RESULT} EQUAL 0)
#   message (STATUS "PKG_GTK3_INCLUDE_DIRS: ${PKG_GTK3_INCLUDE_DIRS}")
   set (PKG_GTK3_INCLUDE_DIRS "-I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/fribidi -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/uuid -I/usr/include/harfbuzz -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/libdrm -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/at-spi-2.0 -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include")
   string (REGEX REPLACE "-I([^ ]+) " "\\1;" PKG_GTK3_INCLUDE_DIRS "${PKG_GTK3_INCLUDE_DIRS}")
   string (REGEX REPLACE "-I([^ ]+)" "\\1" PKG_GTK3_INCLUDE_DIRS "${PKG_GTK3_INCLUDE_DIRS}")
#   message (STATUS "PKG_GTK3_INCLUDE_DIRS: ${PKG_GTK3_INCLUDE_DIRS}")
  endif (PKG_GTK3_FOUND)
 endif (NOT GTK_FOUND AND NOT GTK2_FOUND)

 if (GTK_SUPPORT)
  if (OPENGL_FOUND)
   if (GTK_GL_FOUND)
#   message (STATUS "GTK has GL support")
    set (GTKGL_SUPPORT ON CACHE BOOL "GTK GL support")
    add_definitions (-DGTKGL_SUPPORT)
    option (GTKGL_SUPPORT "enable GTK OpenGL support" ON)
   else ()
    if (GTK_FOUND)
     message (WARNING "GTK has no GL support, falling back")
# *IMPORTANT NOTE*: to use gtkglarea on gtk2, check out the 'gtkglarea-2' branch
#                   of the project
     set (GTKGLAREA_SUPPORT ON CACHE BOOL "GtkGLArea support")
     add_definitions (-DGTKGLAREA_SUPPORT)
     option (GTKGLAREA_SUPPORT "enable GtkGLArea support" ON)
    elseif (PKG_GTK3_FOUND)
# *TODO*: found out the distribution release versions that require this package
     pkg_check_modules (PKG_GTKGL3 gtkgl-3.0)
     if (PKG_GTKGL3_FOUND)
      set (GTKGL_SUPPORT ON CACHE BOOL "GTK GL support")
      add_definitions (-DGTKGL_SUPPORT)
      option (GTKGL_SUPPORT "enable GTK GL support" ON)
     else ()
      set (GTKGL_SUPPORT ON CACHE BOOL "GTK GL support")
      add_definitions (-DGTKGL_SUPPORT)
      option (GTKGL_SUPPORT "enable GTK GL support" ON)
      set (GTKGLAREA_SUPPORT ON CACHE BOOL "GtkGLArea support")
      add_definitions (-DGTKGLAREA_SUPPORT)
      option (GTKGLAREA_SUPPORT "enable GtkGLArea support" ON)
     endif (PKG_GTKGL3_FOUND)
    elseif (PKG_GTK2_FOUND)
     pkg_check_modules (PKG_GTKGL2 gtkgl-2.0)
     if (PKG_GTKGL2_FOUND)
      set (GTKGL_SUPPORT ON CACHE BOOL "GTK GL support")
      add_definitions (-DGTKGL_SUPPORT)
      option (GTKGL_SUPPORT "enable GTK GL support" ON)
     else ()
      pkg_check_modules (PKG_GTKGLEXT gdkglext-1.0 gtkglext-1.0)
      if (PKG_GTKGLEXT_FOUND)
       set (GTKGL_SUPPORT ON CACHE BOOL "GTK GL support")
       add_definitions (-DGTKGL_SUPPORT)
       option (GTKGL_SUPPORT "enable GTK GL support" ON)
      else ()
       set (GTKGLAREA_SUPPORT ON CACHE BOOL "GtkGLArea support")
       add_definitions (-DGTKGLAREA_SUPPORT)
       option (GTKGLAREA_SUPPORT "enable GtkGLArea support" ON)
      endif (PKG_GTKGLEXT_FOUND)
     endif (PKG_GTKGL2_FOUND)
    endif ()
   endif (GTK_GL_FOUND)
  else ()
   message (WARNING "GL not found, continuing")
  endif (OPENGL_FOUND)
 endif (GTK_SUPPORT)
elseif (WIN32)
# *TODO*: repair win32 module support
# find_package (GTK2 MODULE)
# if (NOT GTK2_FOUND)
#  message (FATAL_ERROR "invalid/unknown GTK version")
# else ()
  set (GTK_FOUND ON CACHE BOOL "GTK found")
  set (GTK_SUPPORT ON CACHE BOOL "GTK support")
  add_definitions (-DGTK_SUPPORT)
  set (GTK3_SUPPORT ON CACHE BOOL "GTK3 support")
  add_definitions (-DGTK3_SUPPORT)

# *NOTE*: early versions of gtk do not support GtkBuilder
# *TODO*: --> find the version number(s) and auto-enable this feature for these
#             target systems
# *NOTE*: on Win32 systems, the (binary) gtk3 applications have linkage issues
#         with the latest (2.6.4) libglade distribution (specifically, the
#         libxml2 dll cannot be easily shared between these two packages; also,
#         the 'embedded' library names do not match ('lib'-prefixes))
#         --> disable libglade support when targeting gtk3
# *TODO*: retrieve the available gtk version number(s) from the pkg-config
#         output and pre-set this option accordingly
  set (LIBGLADE_SUPPORT OFF CACHE BOOL "libglade support")
#  add_definitions (-DLIBGLADE_SUPPORT)
  option (LIBGLADE_SUPPORT "enable libglade support" OFF)
  set (LIBGLADE_USE OFF CACHE BOOL "use libglade")
# endif (NOT GTK2_FOUND)

 if (GTK_SUPPORT)
  if (OPENGL_SUPPORT)
   if (GTK_GL_FOUND)
#   message (STATUS "GTK has GL support")
    set (GTKGL_SUPPORT ON CACHE BOOL "GTK GL support")
    add_definitions (-DGTKGL_SUPPORT)
    option (GTKGL_SUPPORT "enable GTK OpenGL support" ON)
   else ()
    message (WARNING "GTK has no GL support, falling back")
# *IMPORTANT NOTE*: to use gtkglarea on gtk2, check out the 'gtkglarea-2' branch
#                   of the project
    set (GTKGLAREA_SUPPORT ON CACHE BOOL "GtkGLArea support")
    add_definitions (-DGTKGLAREA_SUPPORT)
    option (GTKGLAREA_SUPPORT "enable GtkGLArea support" ON)
   endif (GTK_GL_FOUND)
  else ()
   message (WARNING "GL not supported, continuing")
  endif (OPENGL_SUPPORT)
 endif (GTK_SUPPORT)
endif ()

##########################################

#unset (CYGWIN)
#unset (MSYS)
unset (CMAKE_CROSSCOMPILING)
if (UNIX)
 set (wxWidgets_USE_UNICODE ON)
# set (wxWidgets_CONFIG_OPTIONS --toolkit=base --prefix=/usr)
elseif (WIN32)
# message (STATUS "wxWidgets_ROOT_DIR: ${wxWidgets_ROOT_DIR}")
 set (wxWidgets_ROOT_DIR "D:/projects/wxWidgets_win32/wxWidgets-3.0.0")
 set (wxWidgets_LIB_DIR "${wxWidgets_ROOT_DIR}/lib/vc100_dll")
 set (wxWidgets_CONFIGURATION mswu)
 if (CMAKE_BUILD_TYPE STREQUAL Debug)
  set (wxWidgets_CONFIGURATION ${wxWidgets_CONFIGURATION}d)
 endif (CMAKE_BUILD_TYPE STREQUAL Debug)
endif ()
if (CMAKE_BUILD_TYPE STREQUAL Debug)
 set (wxWidgets_USE_DEBUG ON)
 add_definitions (-DwxUSE_LOG_DEBUG)
endif (CMAKE_BUILD_TYPE STREQUAL Debug)
find_package (wxWidgets MODULE
              COMPONENTS aui base core adv gl net html xml xrc)
if (wxWidgets_FOUND)
 include (${wxWidgets_USE_FILE})
 set (WXWIDGETS_SUPPORT ON CACHE BOOL "wxWidgets support")
 add_definitions (-DWXWIDGETS_SUPPORT)
endif (wxWidgets_FOUND)

##########################################

find_package (Curses MODULE)
if (CURSES_FOUND)
 set (CURSES_SUPPORT ON CACHE BOOL "curses support")
 add_definitions (-DCURSES_SUPPORT)
else ()
 if (UNIX)
  pkg_check_modules (PKG_CURSES ncurses panel)
  if (PKG_CURSES_FOUND)
   set (CURSES_SUPPORT ON CACHE BOOL "curses support")
   add_definitions (-DCURSES_SUPPORT)
  endif (PKG_CURSES_FOUND)
 elseif (WIN32)
  find_library (CURSES_LIBRARY pdcurses.lib
                PATHS ${PROJECT_SOURCE_DIR}/../pdcurses
                PATH_SUFFIXES win32
                DOC "searching for pdcurses.lib")
  if (NOT CURSES_LIBRARY)
   message (WARNING "could not find pdcurses.lib, continuing")
  endif (NOT CURSES_LIBRARY)
  find_library (PANEL_LIBRARY panel.lib
                PATHS ${PROJECT_SOURCE_DIR}/../pdcurses
                PATH_SUFFIXES win32
                DOC "searching for panel.lib")
  if (NOT PANEL_LIBRARY)
   message (WARNING "could not find panel.lib, continuing")
  endif (NOT PANEL_LIBRARY)
  if (CURSES_LIBRARY AND PANEL_LIBRARY)
   set (CURSES_SUPPORT ON CACHE BOOL "curses support")
   add_definitions (-DCURSES_SUPPORT)
  endif (CURSES_LIBRARY AND PANEL_LIBRARY)
 endif ()
endif (CURSES_FOUND)

