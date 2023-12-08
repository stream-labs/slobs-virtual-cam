cmake_minimum_required(VERSION 3.22...3.25)

find_package(FFmpeg REQUIRED COMPONENTS avcodec avdevice avutil avformat)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

find_library(COREAUDIO CoreAudio)
find_library(AUDIOUNIT AudioUnit)
find_library(COREFOUNDATION CoreFoundation)
find_library(IOSURF IOSurface)
find_library(COCOA Cocoa)
find_library(GLKIT GLKit)

add_subdirectory(vcam-assistant)
add_subdirectory(vcam-ipc)
add_subdirectory(vcam-plugin)
add_subdirectory(vcam-utils)

add_library(slobs-vritual-cam MODULE)
add_library(OBS::slobs-vritual-cam ALIAS slobs-vritual-cam)

include_directories(
	${CMAKE_SOURCE_DIR}/libobs
	"${vcam-ipc_SOURCE_DIR}/include/"
	${COREAUDIO}
	${AUDIOUNIT}
	${COREFOUNDATION}
	${IOSURF}
	${COCOA}
	${GLKIT}
	${FFMPEG_INCLUDE_DIRS}
)

set(PROJECT_SOURCE
	"${PROJECT_SOURCE_DIR}/vcam-output.cpp"
	"${PROJECT_SOURCE_DIR}/vcam.mm"
	"${PROJECT_SOURCE_DIR}/vcam.hpp"
)

add_library(${PROJECT_NAME} MODULE
	${PROJECT_SOURCE}
)

target_link_libraries(
    slobs-virtual-cam
	libobs
	vcam-ipc
	${COREAUDIO}
	${AUDIOUNIT}
	${COREFOUNDATION}
	${IOSURF}
	${COCOA}
	${GLKIT}
	${FFMPEG_LIBRARIES}
)

# install(DIRECTORY "${PROJECT_SOURCE_DIR}/" DESTINATION "./data/obs-plugins/slobs-virtual-cam" USE_SOURCE_PERMISSIONS
# 	FILES_MATCHING PATTERN "*.sh"
# 	PATTERN "vcam-ipc" EXCLUDE
# 	PATTERN "vcam-utils" EXCLUDE
# 	PATTERN "vcam-plugin" EXCLUDE
# 	PATTERN "vcam-assistant" EXCLUDE
# 	PATTERN "data" EXCLUDE)

set_target_properties_obs(
	slobs-virtual-cam
	PROPERTIES FOLDER plugins
				PREFIX ""
				LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/../../"
				XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC YES
				XCODE_ATTRIBUTE_CLANG_WARN_SUSPICIOUS_IMPLICIT_CONVERSION YES
				XCODE_ATTRIBUTE_GCC_WARN_SHADOW YES)