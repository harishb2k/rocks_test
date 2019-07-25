cmake_minimum_required(VERSION 3.12)
project(simple_example)               # Create project "simple_example"
set(CMAKE_CXX_STANDARD 14)            # Enable c++14 standard

# Add extranal include
# include_directories(/usr/local/Cellar/rocksdb/5.1.2/include)

# Add main.cpp file of project root directory as source file
set(SOURCE_FILES my_db.cc)



# Add executable target with source files listed in SOURCE_FILES variable
add_executable(simple_example ${SOURCE_FILES})

# This will put rocks DB include and Libs in the path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
find_package(rocksdb REQUIRED)
include_directories(${RocksDB_INCLUDE_DIR})
set(LIBS ${LIBS} ${RocksDB_LIBRARIES})
target_link_libraries (simple_example LINK_PUBLIC ${RocksDB_LIBRARIES})

find_package(ZLIB REQUIRED)
set(LIBS ${LIBS} ${ZLIB_LIBRARIES})
target_link_libraries (simple_example LINK_PUBLIC ${ZLIB_LIBRARIES})

# Add lib
# set(FOO_LIB_1 /usr/local/lib/librocksdb.a)
# set(ZLIB /Users/harish.bohara/workspace/personal/rocksdb/libbz2.a)
set(ZLIB_1 /Users/harish.bohara/workspace/personal/rocksdb/libz.a)
set(ZLIB_2 /Users/harish.bohara/workspace/personal/rocksdb/liblz4.a)
set(ZLIB_3 /Users/harish.bohara/workspace/personal/rocksdb/libsnappy.a)
# target_link_libraries(simple_example LINK_PUBLIC ${FOO_LIB_1})
# target_link_libraries(simple_example LINK_PUBLIC ${ZLIB})
target_link_libraries(simple_example LINK_PUBLIC ${ZLIB_1})
target_link_libraries(simple_example LINK_PUBLIC ${ZLIB_2})
target_link_libraries(simple_example LINK_PUBLIC ${ZLIB_3})


find_package (BZip2)
if (BZIP2_FOUND)
    include_directories(${BZIP_INCLUDE_DIRS})
    target_link_libraries (simple_example LINK_PUBLIC ${BZIP2_LIBRARIES})
    message("${BZIP2_LIBRARIES}")
endif (BZIP2_FOUND)



