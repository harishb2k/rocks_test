cmake_minimum_required(VERSION 3.12)
project(rocksdb_app)
set(CMAKE_CXX_STANDARD 14)
SET(CMAKE_C_FLAGS_DEBUG "-D_DEBUG")

# Add main.cpp file of project root directory as source file
set(SOURCE_FILES my_db.cc json_file.cpp)

# Add executable target with source files listed in SOURCE_FILES variable
add_executable(rocksdb_app ${SOURCE_FILES})

set(JSON_BuildTests OFF CACHE INTERNAL "")
add_subdirectory(json)
target_link_libraries(rocksdb_app LINK_PUBLIC nlohmann_json)

# This will put rocks DB include and Libs in the path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

include(ExternalProject)

set(EXTERNAL_INSTALL_LOCATION ${CMAKE_BINARY_DIR}/external/cppkafka)
ExternalProject_Add(
        cppkafka
        GIT_REPOSITORY https://github.com/mfontanini/cppkafka.git
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION} -DCPPKAFKA_DISABLE_TESTS=ON -DCPPKAFKA_BUILD_SHARED=OFF
)
set(CppKafka_INCLUDE_DIRS ${EXTERNAL_INSTALL_LOCATION}/include)
set(CppKafka_LIBRARIES ${EXTERNAL_INSTALL_LOCATION}/lib/libcppkafka.a)

include_directories(${EXTERNAL_INSTALL_LOCATION}/include)
link_directories(${EXTERNAL_INSTALL_LOCATION}/lib)

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


message(STATUS "Harish ${RDKAFKA_LIBRARIES}")
find_package(RDKAFKA REQUIRED)
set(LIBS ${LIBS} ${RDKAFKA_LIBRARIES})
target_link_libraries(rocksdb_app LINK_PUBLIC ${RDKAFKA_LIBRARIES})

include_directories(${CppKafka_INCLUDE_DIRS})
target_link_libraries(rocksdb_app LINK_PUBLIC ${CppKafka_LIBRARIES})

# find_package(CppKafka REQUIRED)
# set(LIBS ${LIBS} ${CPPKAFKA_LIBRARY})
# target_link_libraries(rocksdb_app LINK_PUBLIC ${CPPKAFKA_LIBRARY})
