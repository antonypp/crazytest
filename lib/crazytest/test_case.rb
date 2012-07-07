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
            result_object.fail error, test.method(method.to_sym)
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

    def assert_exeption(exp, exception)
      exp.call
    rescue Exception => e
      if e.is_a? exception
        @result_object.ok
      else
        raise FailError.new "expected #{exception}, but received #{e}"
      end
    end

  end

end
