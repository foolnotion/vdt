cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    vdt
    VERSION 0.4.4
    DESCRIPTION "Fast, vectorized implementations of mathematical functions"
    HOMEPAGE_URL "https://github.com/foolnotion/vdt"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(vdt_vdt INTERFACE)
add_library(vdt::vdt ALIAS vdt_vdt)

set_property(
    TARGET vdt_vdt PROPERTY
    EXPORT_NAME vdt
)

target_include_directories(
    vdt_vdt ${warning_guard}
    INTERFACE
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_compile_features(vdt_vdt INTERFACE cxx_std_20)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Examples ----

if(PROJECT_IS_TOP_LEVEL)
  option(BUILD_EXAMPLES "Build examples tree." "${vdt_DEVELOPER_MODE}")
  if(BUILD_EXAMPLES)
    add_subdirectory(example)
  endif()
endif()

# ---- Developer mode ----

if(NOT vdt_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of vdt"
  )
endif()

include(cmake/dev-mode.cmake)
