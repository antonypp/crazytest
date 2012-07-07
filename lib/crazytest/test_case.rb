module Crazytest
  class FailError < RuntimeError; end

  class TestCase

    class << self
      def run(result_object)
        self.public_instance_methods.grep(/\Atest_.+\z/).each do |method|
          begin
            test = new result_object
            test.send method
          rescue Exception => error
            result_object.fail error
          end
        end
      end
    end

    def initialize(result_object)
      @result_object = result_object
    end

    def assert exp
      if exp
        @result_object.ok
      else
        raise FailError.new "expected true, but received #{exp}"
      end
    end
  end

end
