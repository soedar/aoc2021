def read_file(f)
  File.readlines(f).map(&:to_i)
end

def p1
  values = read_file('input.txt')

  prev, larger = values[0], 0
  values.each do |v|
    larger += 1 if v > prev
    prev = v
  end

  puts larger
end

def p2
  original = read_file('input.txt')

  values = []
  original.each_with_index do |v, i|
    break if i+2 > original.length-1
    values.push(v+original[i+1]+original[i+2])
  end

  prev, larger = values[0], 0
  values.each do |v|
    larger += 1 if v > prev
    prev = v
  end

  puts larger
end

p1
p2
