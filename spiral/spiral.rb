class Spiral

  def initialize(height, width, starting_point)
    @height         = height
    @width          = width
    @matrix         = build_matrix(@height, @width)
    @starting_point = starting_point.split(',')
    @output         = []
    @max_right      = width  - 1
    @max_down       = height - 1
    @max_left       = width  - 1
    @max_up         = height - 1
  end

  def build_matrix(height, width)
    [].tap do |matrix|
      i = 1
      height.times do
        width_arr = []
        width.times do
          width_arr << i
          i += 1
        end
        matrix << width_arr
      end
    end
  end

  def path
    i = @starting_point[1].to_i
    j = @starting_point[0].to_i
    @output << @matrix[i][j]

    while output_has_room?
      current_right = 0
      current_down  = 0
      current_left  = 0
      current_up    = 0

      while current_right < @max_right && output_has_room?
        j += 1
        @output << @matrix[i][j]
        current_right += 1
      end
      @max_right -= 1

      while current_down < @max_down && output_has_room?
        i += 1
        @output << @matrix[i][j]
        current_down += 1
      end
      @max_down  -= 2

      while current_left < @max_left && output_has_room?
        j -= 1
        @output << @matrix[i][j]
        current_left += 1
      end

      @max_left  -= 2

      @max_up    -= 1
      while current_up < @max_up && output_has_room?
        i -= 1
        @output << @matrix[i][j]
        current_up += 1
      end
    end

    @output.join(',')
  end

  def output_has_room?
    @output.count < @height * @width
  end
end
