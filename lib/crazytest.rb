require "crazytest/version"
require "core_ext"

module Crazytest
  autoload "TestCase", "crazytest/test_case"
  autoload "TestRunner", "crazytest/test_runner"
  autoload "ResultObject", "crazytest/result_object"
  autoload "StandardReporter", "crazytest/standard_reporter"
end
