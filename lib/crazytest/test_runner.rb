module Crazytest

  class TestRunner
    def self.run
      reporter = StandardReporter.new
      result_object = ResultObject.new reporter

      at_exit do
         tests = TestCase.descendants
         tests.each do |klass|
           klass.run result_object
         end
         result_object.print
      end
    end
  end

end
