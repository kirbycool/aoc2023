class CubePart1
  ID_REGEX = /Game (\d+):/
  RED_REGEX = /(\d+) red/
  GREEN_REGEX = /(\d+) green/
  BLUE_REGEX = /(\d+) blue/

  def run
    File.readlines('./input.txt').sum do |line|
      turns = parse_game(line)
      valid = turns.all? do |turn|
        turn[:red] <= 12 && turn[:green] <= 13 && turn[:blue] <= 14
      end

      unless valid
        next 0
      end

      id = line.match(ID_REGEX)[1]
      puts id
      Integer(id)
    end
  end

  def parse_game(line)
    turns = line.split(';')
    turns.map do |turn|
      {
        red: Integer(turn.match(RED_REGEX)&.[](1) || 0),
        green: Integer(turn.match(GREEN_REGEX)&.[](1) || 0),
        blue: Integer(turn.match(BLUE_REGEX)&.[](1) || 0),
      }
    end
  end
end
