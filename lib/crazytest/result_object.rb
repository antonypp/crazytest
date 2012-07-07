module Crazytest

  class ResultObject
    def initialize
      @ok_count = 0
      @fail_count = 0
      @fail_result = []
    end

    def ok
      @ok_count += 1
    end

    def fail(error)
      @fail_count +=1
      @fail_result << error
    end
  end

end
