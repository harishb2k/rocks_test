
if(NOT "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-stamp/cppkafka-gitinfo.txt" IS_NEWER_THAN "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-stamp/cppkafka-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-stamp/cppkafka-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/local/bin/git"  clone  "https://github.com/mfontanini/cppkafka.git" "cppkafka"
    WORKING_DIRECTORY "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/mfontanini/cppkafka.git'")
endif()

execute_process(
  COMMAND "/usr/local/bin/git"  checkout master --
  WORKING_DIRECTORY "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

execute_process(
  COMMAND "/usr/local/bin/git"  submodule update --recursive --init 
  WORKING_DIRECTORY "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-stamp/cppkafka-gitinfo.txt"
    "/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-stamp/cppkafka-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/Users/harish.bohara/workspace/personal/rocks_test/cppkafka-prefix/src/cppkafka-stamp/cppkafka-gitclone-lastrun.txt'")
endif()

