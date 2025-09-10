class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      # Split once at first newline: delimiter goes left, rest of string goes right
      delimiter, numbers_part = numbers.split("\n", 2)
      delimiter = delimiter[2..-1] # Remove "//"
      numbers_array = numbers_part.split(delimiter).map(&:to_i)
    else
      numbers_array = numbers.split(/[,\n]/).map(&:to_i)
    end

    negative_numbers = numbers_array.select { |n| n < 0 }
    if negative_numbers.any?
      raise "negative numbers not allowed #{negative_numbers.join(', ')}"
    end

    numbers_array.sum
  end
end
