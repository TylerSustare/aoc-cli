require 'spec_helper'
require 'pry'

RSpec.describe Year2020::Day08 do
  content = []

  it 'solves part1' do
    content = File.open("#{__dir__}/day-08").readlines.map(&:chomp)
    d = Year2020::Day08.new
    expect(d.part1(content)).to eq(1563)
  end

  it 'solves part2' do
    content = File.open("#{__dir__}/day-08").readlines.map(&:chomp)
    d = Year2020::Day08.new
    expect(d.part2(content)).to eq(nil)
  end
end
