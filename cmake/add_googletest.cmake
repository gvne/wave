include(FetchContent)

FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.8.1
)
FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
  FetchContent_Populate(googletest)

  if (NOT ${inca_runtime_static})
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  endif()

  add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
endif()
