class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    parts = numbers.split(',')
    if parts.length == 1
      parts[0].to_i
    else
      parts[0].to_i + parts[1].to_i
    end
  end
end
