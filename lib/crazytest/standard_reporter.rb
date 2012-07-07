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
      puts
      puts
      i = 1
      result_object.fail_result.each do |result, method|
        puts "#{i}) #{method.name.to_s.yellow.bold} (#{method.source_location.join(', ')})"
        if result.message.empty?
          puts "Message: no message given"
        else
          puts "Message: #{result.message}"
        end

        unless result.is_a? FailError
          puts "Trace: #{result.backtrace.join("\n")}"
        end
        i += 1
      end
      puts
      puts "Summary".blue.underline
      puts "Ok      : #{result_object.ok_count}".green
      puts "Failures: #{result_object.fail_count}".red
    end
  end
end
