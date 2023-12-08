cmake_minimum_required(VERSION 3.22...3.25)

target_enable_feature(mac-virtualcam "macOS Virtual Camera support")

if (WIN32)
    add_subdirectory(windows/obs-virtual-cam)
elseif (APPLE)
    add_subdirectory(mac)
endif ()