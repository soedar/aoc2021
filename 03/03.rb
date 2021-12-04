def read_file(file)
  File.readlines(file).map{|l|l.strip.chars.map(&:to_i)}
end

def p1
  lines = read_file('input.txt')

  val = lines.transpose.map do |line|
    line.count(1) > line.length/2 ? 1 : 0
  end

  gamma = val.join.to_i(2)
  epsilon = val.map{|i| i == 0 ? 1 : 0}.join('').to_i(2)
  #epsilon = 2**lines.first.length - gamma - 1

  puts gamma*epsilon
end

def p2
  def filter_pos(lines, position, value)
    lines.filter{|line| line[position] == value}
  end

  def find(lines, position, value)
    lines.transpose[position].count(value)
  end

  def gas(lines, more_val, less_val)
    i = 0
    while lines.length > 1
      n = lines.length
      ones = find(lines, i, 1)
      if ones >= n/2.0
        lines = filter_pos(lines, i, more_val)
      else
        lines = filter_pos(lines, i, less_val)
      end
      i += 1
    end
    lines.first.join.to_i(2)
  end

  def oxygen(lines)
    gas(lines, 1, 0)
  end

  def co2(lines)
    gas(lines, 0, 1)
  end

  lines = read_file('input.txt')
  puts oxygen(lines) * co2(lines)
end

p1
p2

