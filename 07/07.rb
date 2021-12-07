def read_file(file)
  File.readlines(file).first.split(',').map(&:to_i)
end

def p1
  f = read_file('input.txt')

  min = (0..f.max).map do |pos|
    f.map{|crab|(pos-crab).abs}.sum
  end.to_a.min

  puts min
end

def p2
  f = read_file('input.txt')

  min = (0..f.max).map do |pos|
    f.map do |crab|
      n = (pos-crab).abs
      n*(n+1)/2
    end.sum
  end.to_a.min

  puts min
end

p1
p2
