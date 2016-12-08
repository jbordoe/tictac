require './win_checker'

module TicTacToe
  RSpec.describe WinChecker do
    describe '#check' do
      context 'with a valid input string' do
        it 'returns false for a new game' do
          game_str = %w{
            ---
            ---
            ---
          }.join
          expect(WinChecker.check(game_str)).to be false
        end

        it 'returns false for a tied game' do
          game_str = %w{
            oxo
            oxx
            xoo
          }.join
          expect(WinChecker.check(game_str)).to be false
        end

        it 'returns false for games with no winner' do
          game_str_1 = %w{
            -o-
            xx-
            oo-
          }.join
          game_str_2 = %w{
            oxo
            -x-
            x-o
          }.join
          expect(WinChecker.check(game_str_1)).to be false
          expect(WinChecker.check(game_str_2)).to be false
        end

        it 'returns true for a game won by player o' do
          down_diagonal_win = %w{
            oxo
            oox
            xxo
          }.join
          up_diagonal_win = %w{
            xxo
            oox
            oxo
          }.join
          horizontal_win = %w{
            xxo
            ooo
            oxx
          }.join
          vertical_win = %w{
            xox
            -ox
            xoo
          }.join

          expect(WinChecker.check(down_diagonal_win)).to be true
          expect(WinChecker.check(up_diagonal_win)).to be true
          expect(WinChecker.check(vertical_win)).to be true
          expect(WinChecker.check(horizontal_win)).to be true
        end

        it 'returns true for a game won by player x' do
          down_diagonal_win = %w{
            xox
            xxo
            oox
          }.join
          up_diagonal_win = %w{
            xox
            oxo
            xxo
          }.join
          horizontal_win = %w{
            xxx
            xoo
            oox
          }.join
          vertical_win = %w{
            oox
            -ox
            oxx
          }.join

          expect(WinChecker.check(down_diagonal_win)).to be true
          expect(WinChecker.check(up_diagonal_win)).to be true
          expect(WinChecker.check(vertical_win)).to be true
          expect(WinChecker.check(horizontal_win)).to be true
        end
      end

      context 'with an invalid input string' do
        it 'throws an exception if string is too short' do
          expect{ WinChecker.check('xxxooo') }.to raise_error(ArgumentError)
        end

        it 'throws an exception if string is too long' do
          expect{ WinChecker.check('xxxoooxxxooo') }.to raise_error(ArgumentError)
        end

        it 'throws an exception if both sides win' do
          double_win = %w{
            oox
            oox
            oxx
          }.join
          expect{ WinChecker.check(double_win) }.to raise_error(ArgumentError)
        end

        it 'throws an exception if play count is invalid' do
          mismatched_game = %w{
            xxx
            xox
            xxx
          }.join
          expect{ WinChecker.check(mismatched_game) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
