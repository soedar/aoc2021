def read_file(file)
  File.readlines(file).map do |line|
    line.strip.split(' | ').map do |part|
      part.split(' ')
    end
  end
end

def p1
  f = read_file('input.txt')
  n = f.map do |_, output|
    output.filter{|digit| [2,3,4,7].include?(digit.length) }.length
  end.sum

  puts n
end

def p2
  def fix_output(nums, output)
    num_map = {
      "abcefg": 0,
      "cf": 1,
      "acdeg": 2,
      "acdfg": 3,
      "bcdf": 4,
      "abdfg": 5,
      "abdefg": 6,
      "acf": 7,
      "abcdefg": 8,
      "abcdfg": 9,
    }

    # Determine the string that makes up 1 and 4
    one = nums.find{|num|num.length == 2}
    four = nums.find{|num|num.length == 4}

    h = Hash.new
    # count the number of characters in the signal patterns
    count = nums.join.split('').group_by{|c|c}.map{|k,v| [v.length, k]}

    # based on the occurence of each character, we can determine the "real" character
    count.each do |length, k|
      case length
      when 4
        h[k] = 'e'
      when 6
        h[k] = 'b'
      when 9
        h[k] = 'f'
      when 8
        h[k] = (one.include?(k)) ? 'c' : 'a'
      when 7
        h[k] = (four.include?(k)) ? 'd' : 'g'
      end
    end

    # change the character to the one that matches the real segments, and fetch the number
    output.map do |x|
      k = x.split('').map{|c| h[c]}.sort.join
      num_map[k.to_sym]
    end.join.to_i
  end

  f = read_file('input.txt')
  puts f.map{|line| fix_output(*line)}.sum
end

p1
p2
