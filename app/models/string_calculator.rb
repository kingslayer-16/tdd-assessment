class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      # Split once at first newline: delimiter goes left, rest of string goes right
      delimiter, numbers_part = numbers.split("\n", 2)
      delimiter = delimiter[2..-1] # Remove "//"
      numbers_part.split(delimiter).map(&:to_i).sum
    else
      numbers.split(/[,\n]/).map(&:to_i).sum
    end
  end
end
