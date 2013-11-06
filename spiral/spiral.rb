class Spiral
  attr_accessor :matrix, :starting_point, :height, :width, :output

  def initialize(height, width, starting_point)
    self.height = height
    self.width = width
    self.matrix =  build_matrix(self.height, self.width)
    self.starting_point = starting_point.split(',')
    self.output = []
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
    i = starting_point[1].to_i
    j = starting_point[0].to_i

    @max_right     = self.width  - 1
    @max_down      = self.height - 1
    @max_left      = self.width  - 1
    @max_up        = self.height - 1

    output << matrix[i][j]

    while output_has_room?
      current_right = 0
      current_down  = 0
      current_left  = 0
      current_up    = 0

      while current_right < @max_right && output_has_room?
        j += 1
        output << matrix[i][j]
        current_right += 1
      end
      @max_right -= 1

      while current_down < @max_down && output_has_room?
        i += 1
        output << matrix[i][j]
        current_down += 1
      end
      @max_down  -= 2

      while current_left < @max_left && output_has_room?
        j -= 1
        output << matrix[i][j]
        current_left += 1
      end

      @max_left  -= 2

      @max_up    -= 1
      while current_up < @max_up && output_has_room?
        i -= 1
        output << matrix[i][j]
        current_up += 1
      end
    end

    output.join(',')
  end

  def output_has_room?
    self.output.count < self.height * self.width
  end
end
