cmake_minimum_required(VERSION 3.7)

include(ExternalProject)
project(wave CXX)
include(CTest)

# build options
option(wave_enable_tests "Build Unit tests" ON)

# if cmake osx deployment target is defined, don't override the cxx standard
if (NOT CMAKE_OSX_DEPLOYMENT_TARGET)
  set(CMAKE_CXX_STANDARD 14)  # use of c++14
endif()
set(CMAKE_DEBUG_POSTFIX d)  # add the d postfix to generated libraries

include_directories(src)
add_subdirectory(src)

if(${wave_enable_tests})
  include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/add_googletest.cmake)

  # download test resource from https://archive.org/details/test_wav
  set(test_resource_path "${CMAKE_BINARY_DIR}/test_resource")
  file(MAKE_DIRECTORY "${test_resource_path}")
  file(DOWNLOAD "https://archive.org/download/test_wav/Untitled3.wav" "${test_resource_path}/Untitled3.wav")
  file(DOWNLOAD "https://s3.amazonaws.com/audionamix-public/fireworks.wav" "${test_resource_path}/extra-header.wav")
  # Download wikipedia's different format wave https://en.wikipedia.org/wiki/WAV
  set(test_file_list
    11k16bitpcm.wav
    8k16bitpcm.wav
    11k8bitpcm.wav
    11kulaw.wav
    8k8bitpcm.wav
    8kulaw.wav
    11kadpcm.wav
    8kadpcm.wav
    11kgsm.wav
    8kmp316.wav
    8kgsm.wav
    8ksbc12.wav
    8ktruespeech.wav
    8kmp38.wav
    8kcelp.wav
  )
  foreach(file ${test_file_list})
    if(NOT EXISTS "${test_resource_path}/${file}")
      message(STATUS "downloading test file ${file}")
      file(DOWNLOAD "http://www.nch.com.au/acm/${file}" "${test_resource_path}/${file}")
    endif()
  endforeach()
  add_subdirectory(test)
endif ()
