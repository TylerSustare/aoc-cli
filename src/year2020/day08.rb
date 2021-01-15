module Year2020
  class Day08
    def part1(input)
      Computer.new(input).each_step(&:track_inst).halt_when(&:dup_inst?).run.accumulator
      # binding.pry
    end

    def part2(input)
      # Computer.new(input).jmp_nop_swaps.find(&:halts?).accumulator
    end
  end
end

class Computer
  attr_reader :inst, :accumulator

  def initialize(code)
    # TODO: part2-ify
    @code = code.map do |line|
      op, n = line.chomp.split(' ')
      [op, n.to_i]
    end
    reset
  end

  def reset
    @inst = 0
    @accumulator = 0
    @each_step = []
    @halt_when = []
    @instructions = []
    self
  end

  def run
    step until halt?
    self
  end

  def jmp_nop_swaps
    return enum_for(:jmp_nop_swaps) unless block_given?

    @code.each_with_index do |inst, i|
      case inst.first
      when 'nop'
        yield Computer.new(@code.dup.map(&:dup).tap { |code| code[i][0] = 'jmp' })
      when 'jmp'
        yield Computer.new(@code.dup.map(&:dup).tap { |code| code[i][0] = 'nop' })
      end
    end
  end

  def halt?
    # binding.pry
    return true unless @code[@inst]

    @halt_when.any? do |block|
      block.call(self)
    end
  end

  def step
    # binding.pry
    @each_step.each do |block|
      # binding.pry
      block.call(self)
    end

    # binding.pry
    case @code[@inst].first
    when 'acc'
      @accumulator += @code[@inst].last
      @inst += 1
    when 'jmp'
      @inst += @code[@inst].last
    when 'nop'
      @inst += 1
    end
    # binding.pry
  end

  def track_inst
    @instructions << @inst
    # binding.pry
  end

  def dup_inst?
    @instructions.include?(@inst)
    # binding.pry
  end

  def halt_when(&block)
    @halt_when << block
    # binding.pry
    self
  end

  def each_step(&block)
    @each_step << block
    # binding.pry
    self
  end
end
