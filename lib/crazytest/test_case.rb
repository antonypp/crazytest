module Crazytest

  class TestCase

    class << self
      def run(result_object)
        test = new result_object
        test.class.public_instance_methods.grep(/\Atest_.+\z/).each do |method|
          begin
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
        raise
      end
    end
  end

end
