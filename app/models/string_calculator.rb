class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      # Split once at first newline: delimiter goes left, rest of string goes right
      delimiter_part, numbers_part = numbers.split("\n", 2)
      delimiter_string = delimiter_part[2..-1] # Remove "//"

      # Handle multiple delimiters with [delim1][delim2] format
      if delimiter_string.count("[") > 1
        # Extract all delimiters between brackets - simple way
        delimiters = []
        delimiter_string.split("]").each do |part|
          if part.include?("[")
            delimiters << part.split("[")[1]
          end
        end

        # Split by each delimiter one by one
        numbers_array = [numbers_part]
        delimiters.each do |delim|
          numbers_array = numbers_array.flat_map { |part| part.split(delim) }
        end
        numbers_array = numbers_array.map(&:to_i)
      elsif delimiter_string.start_with?("[") && delimiter_string.end_with?("]")
        # Handle single [delimiter] format for delimiters of any length
        delimiter = delimiter_string[1..-2] # Remove brackets
        numbers_array = numbers_part.split(delimiter).map(&:to_i)
      else
        # Handle simple single character delimiter
        numbers_array = numbers_part.split(delimiter_string).map(&:to_i)
      end
    else
      numbers_array = numbers.split(/[,\n]/).map(&:to_i)
    end

    negative_numbers = numbers_array.select { |n| n < 0 }
    if negative_numbers.any?
      raise "negative numbers not allowed #{negative_numbers.join(', ')}"
    end

    # Ignore numbers bigger than 1000
    filtered_numbers = numbers_array.select { |n| n <= 1000 }
    filtered_numbers.sum
  end
end
