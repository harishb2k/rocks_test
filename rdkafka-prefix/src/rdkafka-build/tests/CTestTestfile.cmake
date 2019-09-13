# CMake generated Testfile for 
# Source directory: /Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests
# Build directory: /Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka-build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(RdKafkaTestInParallel "/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka-build/tests/rdkafka_test" "-p5")
set_tests_properties(RdKafkaTestInParallel PROPERTIES  _BACKTRACE_TRIPLES "/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests/CMakeLists.txt;108;add_test;/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests/CMakeLists.txt;0;")
add_test(RdKafkaTestSequentially "/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka-build/tests/rdkafka_test" "-p1")
set_tests_properties(RdKafkaTestSequentially PROPERTIES  _BACKTRACE_TRIPLES "/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests/CMakeLists.txt;109;add_test;/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests/CMakeLists.txt;0;")
add_test(RdKafkaTestBrokerLess "/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka-build/tests/rdkafka_test" "-p5" "-l")
set_tests_properties(RdKafkaTestBrokerLess PROPERTIES  _BACKTRACE_TRIPLES "/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests/CMakeLists.txt;110;add_test;/Users/harish.bohara/workspace/personal/rocks_test/rdkafka-prefix/src/rdkafka/tests/CMakeLists.txt;0;")
