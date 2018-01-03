add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/appimagetool-48x48.png ${CMAKE_CURRENT_BINARY_DIR}/alacarte-96x96.png ${CMAKE_CURRENT_BINARY_DIR}/oxygen-launch-96x96.png
    COMMAND rsvg-convert -f png -o ${CMAKE_CURRENT_BINARY_DIR}/appimagetool-48x48.png -w 48 -h 48 ${CMAKE_CURRENT_SOURCE_DIR}/appimagetool.svg
    COMMAND rsvg-convert -f png -o ${CMAKE_CURRENT_BINARY_DIR}/alacarte-96x96.png -w 96 -h 96 ${CMAKE_CURRENT_SOURCE_DIR}/alacarte.svg
    COMMAND rsvg-convert -f png -o ${CMAKE_CURRENT_BINARY_DIR}/oxygen-launch-96x96.png -w 96 -h 96 ${CMAKE_CURRENT_SOURCE_DIR}/oxygen-launch.svg
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/appimagetool.svg ${CMAKE_CURRENT_SOURCE_DIR}/alacarte.svg ${CMAKE_CURRENT_SOURCE_DIR}/oxygen-launch.svg
    COMMENT "Create PNG files for SVGs"
)

add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/dialog_images.h
    COMMAND xxd -i appimagetool-48x48.png > dialog_images.h
    COMMAND xxd -i alacarte-96x96.png >> dialog_images.h
    COMMAND xxd -i oxygen-launch-96x96.png >> dialog_images.h
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}  # important to make sure the variables in the header file have relative paths
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/appimagetool-48x48.png ${CMAKE_CURRENT_BINARY_DIR}/alacarte-96x96.png ${CMAKE_CURRENT_BINARY_DIR}/oxygen-launch-96x96.png
    COMMENT "Create header file with PNG contents"
)

add_custom_target(resources
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/dialog_images.h
)

set(resources_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR} PARENT_SCOPE)
