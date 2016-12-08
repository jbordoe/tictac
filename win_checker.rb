module TicTacToe
  class WinChecker
    def self.check(str)
      players = ['o', 'x']
      win_count = 0

      raise ArgumentError unless game_valid?(str)

      players.each do |player|
        player_wins =
          horizontal_win(player, str) ||
          vertical_win(player, str) ||
          diagonal_win(player, str)

        win_count += 1 if player_wins
      end

      raise ArgumentError if win_count > 1

      win_count == 1
    end

    private

    def self.game_valid?(str)
      (str.length == 9) &&
      (str.count('x') - str.count('o')).abs <= 1
    end

    def self.horizontal_win(player, game_str)
      !!game_str.match(/^(...){,2}#{player}{3}(...){,2}$/)
    end

    def self.vertical_win(player, game_str)
      !!game_str.match(/(#{player}..){2}#{player}/)
    end

    def self.diagonal_win(player, game_str)
      !!game_str.match(/^(#{player}...){2}#{player}$/) ||
      !!game_str.match(/^..(#{player}.){2}#{player}..$/)
    end
  end
end
