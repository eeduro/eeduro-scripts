cmake_minimum_required(VERSION 2.8)

add_subdirectory(eeros)

set(ADDITIONAL_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/eeros/includes ${CMAKE_BINARY_DIR}/eeros)
set(ADDITIONAL_LINK_DIRS ${CMAKE_BINARY_DIR}/eeros/src)

add_subdirectory(eeduro)
