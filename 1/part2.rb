class Trebuchet
  REGEX = /(?=(\d|one|two|three|four|five|six|seven|eight|nine))/
  NUMBER_TO_DIGIT = {
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9
  }

  def run
    File.readlines('./trebuchet_input.txt').sum do |line|
      first = nil
      last = nil

      line.scan(REGEX).each do |group|
        match = group[0]
        number = (
          begin
            Integer(match)
          rescue
            NUMBER_TO_DIGIT[match]
          end
        )
        if first.nil?
          first = number
        end
        last = number
      end

      if first.nil?
        next 0
      end

      first * 10 + last
    end
  end
end
