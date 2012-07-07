module Crazytest

  class ResultObject

    attr_reader :ok_count, :fail_count, :fail_result

    def initialize(reporter)
      @ok_count = 0
      @fail_count = 0
      @fail_result = []
      @reporter = reporter
    end

    def ok
      @ok_count += 1
      @reporter.print_point :ok
    end

    def fail(error)
      @fail_count +=1
      @fail_result << error
      if error.is_a? FailError
        @reporter.print_point :fail
      else
        @reporter.print_point :error
      end
    end

    def print
      @reporter.print_report self
    end
  end

end
