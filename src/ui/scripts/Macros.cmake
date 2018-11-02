function (is_UI_graphical UI_FRAMEWORK)
# sanity check(s)
 if (NOT GUI_SUPPORT)
  message (STATUS "GUI_SUPPORT not set, continuing")
 endif (NOT GUI_SUPPORT)

 if (${UI_FRAMEWORK} MATCHES "gtk" OR
     ${UI_FRAMEWORK} MATCHES "wxWidgets")
 elseif (${UI_FRAMEWORK} MATCHES "curses")
  set (UI_FRAMEWORK "" PARENT_SCOPE)
 else ()
  message (FATAL_ERROR "invalid/unknown UI (was: \"${UI_FRAMEWORK}\"), aborting")
 endif ()
endfunction (is_UI_graphical)

function (disable_alternate_UI_support UI_FRAMEWORK)
# sanity check(s)
 if (NOT GUI_SUPPORT)
  message (STATUS "GUI_SUPPORT not set, continuing")
 endif (NOT GUI_SUPPORT)

 if (${UI_FRAMEWORK} MATCHES "gtk")
  unset (CURSES_SUPPORT)
  unset (WXWIDGETS_SUPPORT)
 elseif (${UI_FRAMEWORK} MATCHES "wxWidgets")
  unset (CURSES_SUPPORT)
  unset (GTK_SUPPORT)
 elseif (${UI_FRAMEWORK} MATCHES "curses")
  unset (GTK_SUPPORT)
  unset (WXWIDGETS_SUPPORT)
 else ()
  message (FATAL_ERROR "invalid/unknown UI (was: \"${UI_FRAMEWORK}\"), aborting")
 endif ()
endfunction (disable_alternate_UI_support)
