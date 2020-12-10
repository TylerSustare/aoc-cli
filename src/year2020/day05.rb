module Year2020
  class Day05
    def initialize
      @seat_ids = []
      @seat = { 'row': 0, 'column': 0 }
      @min = 0
      @max = 0
    end

    def part1(input)
      input.each { |e| add_seat_id(e.split('')) }
      @seat_ids.max
    end

    def part2(input)
      input.each { |e| add_seat_id(e.split('')) }
      @seat_ids.sort!
      @seat_ids.each_with_index do |val, idx|
        return val + 1 if val + 1 != @seat_ids[idx + 1] && !@seat_ids[idx + 1].nil?
      end
    end

    private

    def add_seat_id(instructions)
      set_min_max(min: 0, max: 127)
      instructions[0..6].each { |char| find_seat(char) }
      set_min_max(min: 0, max: 7)
      instructions[7..9].each { |char| find_seat(char) }
      @seat_ids.push(@seat['row'] * 8 + @seat['column'])
    end

    def find_seat(char)
      @min = @max - ((@max - @min) / 2) if %w[B R].any?(char)
      @max = @min + ((@max - @min) / 2) if %w[F L].any?(char)
      @seat['row'] = @min if @min == @max && %w[B F].any?(char)
      @seat['column'] = @min if @min == @max && %w[R L].any?(char)
    end

    def set_min_max(min:, max:)
      @min = min
      @max = max
    end
  end
end
