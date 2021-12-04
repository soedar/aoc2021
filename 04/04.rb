def read_file(file)
  draw = []
  board = []
  boards = []
  File.readlines(file).each_with_index do |line, i|
    if i == 0
      draw = line.strip.split(',')
      next
    end

    if line.strip == ''
      boards.push(board.flatten) if board.length > 0
      board = []
    else
      board.push(line.strip.split(' '))
    end
  end

  boards.push(board.flatten)

  [draw, boards]
end

# returns [win index, marked, unmarked]
def check_board(board, draw)
  def check(marked_idx)
    5.times do |i|
      # check row
      found = true
      5.times do |j|
        found = false if !marked_idx[i+5*j]
      end
      return true if found

      # check column
      found = true
      5.times do |j|
        found = false if !marked_idx[i*5+j]
      end
      return true if found
    end
    false
  end

  marked_idx = Hash.new(false)
  marked = []

  draw.each_with_index do |number, i|
    idx = board.find_index(number)
    if idx != nil
      marked_idx[idx] = true
      marked.push(number)
    end

    return [i, number, marked, board-marked] if check(marked_idx)
  end
  false
end

def p1
  draw, boards = read_file('input.txt')

  fastest = boards.map do |board|
    check_board(board, draw)
  end.sort.first

  i, number, marked, unmarked = fastest
  puts unmarked.map(&:to_i).sum * number.to_i
end

def p2
  draw, boards = read_file('input.txt')

  slowest = boards.map do |board|
    check_board(board, draw)
  end.sort.last

  i, number, marked, unmarked = slowest
  puts unmarked.map(&:to_i).sum * number.to_i
end

p1
p2
