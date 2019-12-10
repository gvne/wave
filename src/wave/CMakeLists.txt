add_library(wave
  header/data_header.h
  header/data_header.cc
  header/riff_header.h
  header/riff_header.cc
  header/fmt_header.h
  header/fmt_header.cc
  header/wave_header.h
  header/wave_header.cc

  header.h
  header.cc
  header_list.h
  header_list.cc

  error.h
  file.h
  file.cc
)

target_include_directories(wave PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>
  $<INSTALL_INTERFACE:include>
)

# install rules
install(TARGETS wave
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)
install(FILES
  file.h
  error.h
  DESTINATION include/wave
)
