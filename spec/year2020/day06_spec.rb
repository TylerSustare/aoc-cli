require 'spec_helper'

RSpec.describe Year2020::Day06 do
  content = File.read("#{__dir__}/day-06").split("\n\n").map { |line| line.split.map { |char| char.split('') }.map { |element| Set[*element] } }
  it 'solves part1' do
    d = Year2020::Day06.new
    expect(d.part1(content)).to be == 6587
    # expect(d.part1(content)).to be == 11 # test input
  end

  it 'solves part2' do
    d = Year2020::Day06.new
    expect(d.part2(content)).to eq(3235)
    # expect(d.part2(content)).to eq(6) # test input
  end
end
