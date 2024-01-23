# @param {Character[][]} board
# @return {Boolean}
# Link: https://leetcode.com/problems/valid-sudoku/description/
def is_valid_sudoku(board)
  for i in 0..8
    a = Hash.new

    for j in 0..8
      if board[i][j] != '.'
        a[board[i][j]] = 0 if a[board[i][j]].nil?
        a[board[i][j]] += 1
        return false if a[board[i][j]] >= 2
      end

    end
  end

  # puts 'A'

  for j in 0..8
    a = Hash.new

    for i in 0..8
      if board[i][j] != '.'
        a[board[i][j]] = 0 if a[board[i][j]].nil?
        a[board[i][j]] += 1

        return false if a[board[i][j]] >= 2
      end
    end
  end

  # puts 'B'

  [0, 3, 6].each do |i|
    [0, 3, 6].each do |j|
      a = Hash.new

      for m in 0..2
        for n in 0..2
          if board[i+m][j+n] != '.'
            a[board[i+m][j+n]] = 0 if a[board[i+m][j+n]].nil?
            a[board[i+m][j+n]] += 1

            return false if a[board[i+m][j+n]] >= 2
          end
        end
      end
    end
  end

  # puts 'C'

  true
end
