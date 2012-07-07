module Crazytest

  class TestRunner
    def self.run
      result_object = Crazytest::ResultObject.new
      at_exit do
         tests = Crazytest::TestCase.descendants
         tests.each do |klass|
           klass.run result_object
         end
         raise result_object.inspect
      end
    end
  end

end
