add_executable(dialog dialog.cpp)

target_link_libraries(dialog
    fltk
    fltk_images
    libdesktopenvironments
)

add_dependencies(dialog resources)

target_include_directories(dialog PRIVATE ${resources_INCLUDE_DIR} ${PROJECT_BINARY_DIR}/lib/fltk ${PROJECT_SOURCE_DIR}/lib/fltk)
