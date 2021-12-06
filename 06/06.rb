def read_file(file)
  File.readlines(file).first.split(',').map(&:to_i)
end

def p1
  f = read_file('input.txt')

  h = Hash.new(0)
  f.each do |ff|
    h[ff] += 1
  end

  80.times do |i|
    zeroes = h[0]

    (1..8).each do |t|
      h[t-1] = h[t]
    end

    h[6] += zeroes
    h[8] = zeroes
  end

  puts h.values.sum
end

def p2
  f = read_file('input.txt')

  h = Hash.new(0)
  f.each do |ff|
    h[ff] += 1
  end

  256.times do |i|
    zeroes = h[0]

    (1..8).each do |t|
      h[t-1] = h[t]
    end

    h[6] += zeroes
    h[8] = zeroes
  end

  puts h.values.sum
end

p1
p2
