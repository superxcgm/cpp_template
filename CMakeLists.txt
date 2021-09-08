cmake_minimum_required(VERSION 3.10)
project(calculator)

set(CMAKE_CXX_STANDARD 17)

if (EXISTS ${CMAKE_BINARY_DIR}/conan_paths.cmake)
    include(${CMAKE_BINARY_DIR}/conan_paths.cmake)
endif ()

aux_source_directory(src EXE_SOURCES)
list(FILTER EXE_SOURCES INCLUDE REGEX "^.*.cc$")
add_executable(${PROJECT_NAME} ${EXE_SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE include)

aux_source_directory(test TEST_SOURCES)
list(FILTER TEST_SOURCES INCLUDE REGEX "^.*_test.cc$")

if (NOT "${TEST_SOURCES}" STREQUAL "")
    list(FILTER EXE_SOURCES EXCLUDE REGEX "main.cc")
    add_executable(${PROJECT_NAME}_test ${EXE_SOURCES} ${TEST_SOURCES} test/test_main.cc)
    target_include_directories(${PROJECT_NAME}_test PRIVATE include)
    find_package(GTest REQUIRED)
    target_link_libraries(${PROJECT_NAME}_test GTest::GTest)
endif ()
