def read_file(file)
  raw = File.readlines(file).map{|line| line.strip.split('').map(&:to_i)}

  data = Hash.new
  raw.each_with_index do |row, j|
    row.each_with_index do |value, i|
      data[[i,j]] = value
    end
  end
  data
end

def p1
  data = read_file('input.txt')

  delta = [[0,1],[0,-1],[1,0],[-1,0]]
  low_points = []
  data.each do |p, v|
    lowest = true
    delta.each do |diff|
      np = [p[0]+diff[0],p[1]+diff[1]]
      lowest = false if data.include?(np) && v >= data[np]
    end

    low_points.push(p) if lowest
  end

  puts low_points.map{|p|data[p]+1}.sum
end

def p2
  data = read_file('input.txt')

  delta = [[0,1],[0,-1],[1,0],[-1,0]]
  low_points = []
  data.each do |p, v|
    lowest = true
    delta.each do |diff|
      np = [p[0]+diff[0],p[1]+diff[1]]
      lowest = false if data.include?(np) && v >= data[np]
    end

    low_points.push(p) if lowest
  end

  basins = low_points.map do |point|
    visited = []
    queue = [point]

    while queue.length > 0
      p = queue.shift
      next if visited.include?(p)

      visited.push(p)
      delta.each do |diff|
        np = [p[0]+diff[0],p[1]+diff[1]]
        queue.push(np) if data.include?(np) && data[np] != 9
      end
    end
    [point, visited.length]
  end

  puts basins.map{|k,v|v}.sort.last(3).reduce(:*)
end

p1
p2
