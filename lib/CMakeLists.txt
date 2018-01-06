add_subdirectory(libdesktopenvironments)

set(OPTION_USE_XFT ON)
set(OPTION_USE_SYSTEM_LIBPNG OFF)
set(OPTION_USE_SYSTEM_ZLIB ON)

set(OPTION_USE_GL OFF)
set(OPTION_USE_XINERAMA OFF)
set(OPTION_USE_XFIXES OFF)
set(OPTION_USE_XDBE OFF)
set(OPTION_USE_XCURSOR OFF)
set(OPTION_USE_XRENDER OFF)

add_subdirectory(fltk)

add_subdirectory(AppImageKit)
