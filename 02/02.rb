def read_file(f)
  File.readlines(f).map{|l| l.strip.split(' ')}
end

def p1
  f = read_file('input.txt')

  h, d = 0, 0
  f.each do |cmd, val|
    v = val.to_i
    if cmd == 'forward'
      h += v
    elsif cmd == 'up'
      d -= v
    elsif cmd == 'down'
      d += v
    end
  end

  puts h*d
end

def p2
  f = read_file('input.txt')

  a, h, d = 0, 0, 0
  f.each do |cmd, val|
    v = val.to_i

    if cmd == 'forward'
      h += v
      d += a*v
    elsif cmd == 'up'
      a -= v
    elsif cmd == 'down'
      a += v
    end
  end

  puts h*d
end

p1
p2
