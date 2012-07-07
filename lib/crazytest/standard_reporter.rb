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
      2.times do; puts end
      i = 1
      result_object.fail_result.each do |result, method|
        # title
        puts "#{i}) #{method.name.to_s.yellow.bold} (#{method.source_location.join(', ')})"

        # message
        if result.message.empty?
          puts "Message: `no message given`"
        else
          puts "Message: `#{result.message}`"
        end

        # code
        line_number = result.backtrace[1].match('/*:(\d+)/*')[1].to_i
        if line_number > 0
          puts "Code:"
          code = read_line(method.source_location.first, line_number)
          puts "#{line_number}: #{code}".cyan
        end

        # trace
        unless result.is_a? FailError
          puts "Trace: #{result.backtrace.join("\n")}"
        end

        i += 1
      end

      # summary
      puts "Summary".blue.underline
      puts "Ok      : #{result_object.ok_count}".green
      puts "Failures: #{result_object.fail_count}".red
    end

    private

    def read_line(filename, line_number)
      f = File.open(filename)
      line =  [*f][line_number-1]
      f.close
      line
    end
  end
end
