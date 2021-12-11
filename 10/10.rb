def read_file(file)
  File.readlines(file).map{|line|line.strip.split('')}
end

def p1
  lines = read_file('input.txt')

  valid = {
    ')' => '(',
    ']' => '[',
    '}' => '{',
    '>' => '<',
  }

  corrupted = []
  lines.each do |line|
    stack = []
    line.each do |c|
      if ['(','[','{','<'].include?(c)
        stack.push(c)
      else
        e = stack.pop()
        if e != valid[c]
          corrupted.push(c)
          break
        end
      end
    end
  end

  score = {
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137,
  }

  puts corrupted.map{|c|score[c]}.sum
end

def p2
  lines = read_file('input.txt')

  valid = {
    ')' => '(',
    ']' => '[',
    '}' => '{',
    '>' => '<',
  }

  incompleted = []
  lines.each do |line|
    stack = []
    is_corrupted = false
    line.each do |c|
      if ['(','[','{','<'].include?(c)
        stack.push(c)
      else
        e = stack.pop()
        if e != valid[c]
          is_corrupted = true
          break
        end
      end
    end
    incompleted.push(stack) if !is_corrupted && stack.length > 0
  end

  cscore = {
    '(' => 1,
    '[' => 2,
    '{' => 3,
    '<' => 4,
  }

  score = incompleted.map do |line|
    score = 0
    line.reverse.each do |c|
      score = score*5 + cscore[c]
    end
    score
    # line.reverse.reduce(0) { |n, c| n*5 + cscore[c] }
  end

  puts score.sort[(score.length-1)/2]
end

p1
p2
