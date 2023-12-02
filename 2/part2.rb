class CubePart2
  ID_REGEX = /Game (\d+):/
  RED_REGEX = /(\d+) red/
  GREEN_REGEX = /(\d+) green/
  BLUE_REGEX = /(\d+) blue/

  def run
    File.readlines('./input.txt').sum do |line|
      game_power(line)
    end
  end

  def game_power(game)
    turns = parse_game(game)
    min_red = turns.map { |turn| turn[:red] }.max
    min_green = turns.map { |turn| turn[:green] }.max
    min_blue = turns.map { |turn| turn[:blue] }.max

    min_red * min_green * min_blue
  end

  def parse_game(game)
    turns = game.split(';')
    turns.map do |turn|
      {
        red: Integer(turn.match(RED_REGEX)&.[](1) || 0),
        green: Integer(turn.match(GREEN_REGEX)&.[](1) || 0),
        blue: Integer(turn.match(BLUE_REGEX)&.[](1) || 0),
      }
    end
  end
end
