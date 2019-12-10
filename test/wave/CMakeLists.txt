add_executable(wave_tests
  file_test.cc
  header_test.cc
)

if (UNIX AND NOT APPLE)
  target_link_libraries(wave_tests
    gtest
    gtest_main
    wave
    pthread
  )
elseif(WIN32)
  target_link_libraries(wave_tests
    gtest
    gtest_main
    wave
  )
endif()

target_compile_definitions(wave_tests
  PUBLIC -DTEST_RESOURCES_PATH="${test_resource_path}"
)
