# Mapper
class Mapper
  attr_reader :colors

  def mapper(str)
    @colors = str.split(//).to_a.uniq
    @colors.delete("\n")
    temp = str.split("\n")
    temp.map { |l| line_dec(l) }
  end

  private

  def line
    line_sub = []
    line_sub.push(@color_number, @color_sum)
    @line.push(line_sub)
    color_switch
  end

  def color_switch
    @colors.each_with_index do |color, cindex|
      @color_number = cindex if @ch == color
    end
  end

  def line_array(line_array)
    line_array.each do |ch|
      @ch = ch
      if ch == @colors[@color_number]
        @color_sum += 1
      else
        line
        @color_sum = 1
      end
    end
    line
  end

  def line_dec(str)
    @line = []
    line_array = str.split(//).to_a
    @color_number = 0
    @color_sum = 0
    line_array(line_array)
    @line
  end
end

# TEST
if $PROGRAM_NAME == __FILE__
  # String to map
  str = '                                    
          ████████████████          
       ███▒▒▒          ▒▒▒███       
     ██▒▒▒▒              ▒▒▒▒██     
   ██                         ██    
  █▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒█  
 █▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒█ 
 █▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒█ 
 █▒▒▒▒▒     ▒▒▒▒▒▒▒▒▒▒▒▒     ▒▒▒▒▒█ 
 █    ████████████████████████    █ 
 █    █     ██        ██     █    █ 
 █    █     ██        ██     █    █ 
 ██████     ██        ██     ██████ 
   ██                          ██   
    █                          █    
     █                        █     
       ██████████████████████       
                                    '

  machine = Mapper.new
  print machine.mapper(str)
  puts ''
  print machine.colors
end
