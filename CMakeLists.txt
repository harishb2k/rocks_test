cmake_minimum_required(VERSION 3.12)
project(rocksdb_app)
set(CMAKE_CXX_STANDARD 14)

# Add main.cpp file of project root directory as source file
set(SOURCE_FILES my_db.cc)

# Add executable target with source files listed in SOURCE_FILES variable
add_executable(rocksdb_app ${SOURCE_FILES})

# This will put rocks DB include and Libs in the path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

find_package(rocksdb REQUIRED)
include_directories(${RocksDB_INCLUDE_DIR})
set(LIBS ${LIBS} ${RocksDB_LIBRARIES})
target_link_libraries(rocksdb_app LINK_PUBLIC ${RocksDB_LIBRARIES})

find_package(ZLIB REQUIRED)
set(LIBS ${LIBS} ${ZLIB_LIBRARIES})
target_link_libraries(rocksdb_app LINK_PUBLIC ${ZLIB_LIBRARIES})

find_package(SNAPPY REQUIRED)
set(LIBS ${LIBS} ${SNAPPY_LIBRARIES})
target_link_libraries(rocksdb_app LINK_PUBLIC ${SNAPPY_LIBRARIES})

find_package(BZIP2 REQUIRED)
set(LIBS ${LIBS} ${BZIP2_LIBRARIES})
target_link_libraries(rocksdb_app LINK_PUBLIC ${BZIP2_LIBRARIES})

