set(CMAKE_SYSTEM_NAME Linux)

set(CMAKE_C_COMPILER   ${CMAKE_CURRENT_LIST_DIR}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${CMAKE_CURRENT_LIST_DIR}/bin/arm-linux-gnueabihf-g++)

# where is the target environment 
set(CMAKE_FIND_ROOT_PATH ${CMAKE_CURRENT_LIST_DIR}/arm-linux-gnueabihf)

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_CXX_FLAGS "-std=c++0x" CACHE STRING "" FORCE)
set(LINUX TRUE CACHE BOOL "" FORCE)
