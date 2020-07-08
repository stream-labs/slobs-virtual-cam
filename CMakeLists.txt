cmake_minimum_required(VERSION 3.0)
project(slobs-virtual-cam)

if (WIN32)
    add_subdirectory(windows/obs-virtual-cam)
elseif (APPLE)
    add_subdirectory(mac)
endif ()