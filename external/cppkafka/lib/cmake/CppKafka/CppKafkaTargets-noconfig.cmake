#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CppKafka::cppkafka" for configuration ""
set_property(TARGET CppKafka::cppkafka APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(CppKafka::cppkafka PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libcppkafka.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS CppKafka::cppkafka )
list(APPEND _IMPORT_CHECK_FILES_FOR_CppKafka::cppkafka "${_IMPORT_PREFIX}/lib/libcppkafka.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
