module Crazytest

  class TestRunner
    def self.run
      reporter = StandardReporter.new
      result_object = ResultObject.new reporter
      Signal.trap("SIGINT", proc{ result_object.print; exit})
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
