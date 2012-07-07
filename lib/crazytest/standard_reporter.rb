module Crazytest

  class StandardReporter

    def print_point(result)
      case result
        when :ok then print '*'
        when :fail then print 'F'
        when :error then print 'E'
      end
    end

    def print_report(result_object)
      puts ""
      result_object.fail_result.each do |result|
        puts "Message: #{result.message}"
        unless result.is_a? FailError
          puts "Trace: #{result.backtrace.join("\n")}"
        end
      end
      puts "Ok: #{result_object.ok_count}, Failures: #{result_object.fail_count}"
    end
  end
end
