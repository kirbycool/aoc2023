class Trebuchet
  def run
    File.readlines('./trebuchet_input.txt').sum do |line|
      first = nil
      last = nil

      line.each_char do |c|
        number = Integer(c)
        if first.nil?
          first = number
        end
        last = number
      rescue
        next
      end

      if first.nil?
        return 0
      end

      first * 10 + last
    end
  end
end
