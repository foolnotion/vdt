cmake_minimum_required(VERSION 3.14)

project(vdtTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(vdt REQUIRED)
  enable_testing()
endif()

# ---- Tests ----

add_executable(vdt_test source/vdt_test.cpp)
target_link_libraries(vdt_test PRIVATE vdt::vdt)
target_compile_features(vdt_test PRIVATE cxx_std_20)

add_test(NAME vdt_test COMMAND vdt_test)

# ---- End-of-file commands ----

add_folders(Test)
