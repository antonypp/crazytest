module Crazytest

  class StandardReporter

    def print_point(result)
      case result
        when :ok then print '*'.green
        when :fail then print 'F'.red
        when :error then print 'E'.red
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
      puts "Summary".blue.underline
      puts "Ok      : #{result_object.ok_count}".green
      puts "Failures: #{result_object.fail_count}".red
    end
  end
end
