def read_file(file)
  File.readlines(file).map do |line|
    _, x1, y1, x2, y2 = /(\d+),(\d+) -> (\d+),(\d+)/.match(line).to_a
    [[x1.to_i,y1.to_i],[x2.to_i,y2.to_i]]
  end
end

def get_points(p1, p2)
  dx = p2[0]-p1[0]
  dy = p2[1]-p1[1]

  mdx = (dx == 0) ? 0 : (dx > 0) ? 1 : -1
  mdy = (dy == 0) ? 0 : (dy > 0) ? 1 : -1

  values = []
  while p1 != p2
    values.push(p1)
    p1 = [p1[0] + mdx, p1[1] + mdy]
  end
  values.push(p2)

  values
end

def p1
  points = read_file('input.txt')

  h = Hash.new(0)
  points = points.filter do |p1, p2|
    p1[0] == p2[0] || p1[1] == p2[1]
  end

  points.each do |p1, p2|
    get_points(p1, p2).each do |pp|
      h[pp] += 1
    end
  end

  puts h.values.filter{|x| x > 1}.length
end

def p2
  points = read_file('input.txt')

  h = Hash.new(0)
  points.each do |p1, p2|
    get_points(p1, p2).each do |pp|
      h[pp] += 1
    end
  end

  puts h.values.filter{|x| x > 1}.length
end

p1
p2
