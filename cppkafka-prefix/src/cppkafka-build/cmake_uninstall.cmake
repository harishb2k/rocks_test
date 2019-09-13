# Taken from https://cmake.org/Wiki/CMake_FAQ#Can_I_do_.22make_uninstall.22_with_CMake.3F

if(NOT EXISTS "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-build/install_manifest.txt")
  message(FATAL_ERROR "Cannot find install manifest: /Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-build/install_manifest.txt")
endif(NOT EXISTS "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-build/install_manifest.txt")

file(READ "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-build/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
  message(STATUS "Uninstalling $ENV{DESTDIR}${file}")
  if(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
    exec_program(
      "/usr/local/Cellar/cmake/3.15.0/bin/cmake" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    if(NOT "${rm_retval}" STREQUAL 0)
      message(FATAL_ERROR "Problem when removing $ENV{DESTDIR}${file}")
    endif(NOT "${rm_retval}" STREQUAL 0)
  else(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
    message(STATUS "File $ENV{DESTDIR}${file} does not exist.")
  endif(IS_SYMLINK "$ENV{DESTDIR}${file}" OR EXISTS "$ENV{DESTDIR}${file}")
endforeach(file)
