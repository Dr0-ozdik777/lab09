if(EXISTS "/home/ubuntu/Dr0-ozdik777/workspace/projects/lab09/build/check[1]_tests.cmake")
  include("/home/ubuntu/Dr0-ozdik777/workspace/projects/lab09/build/check[1]_tests.cmake")
else()
  add_test(check_NOT_BUILT check_NOT_BUILT)
endif()
