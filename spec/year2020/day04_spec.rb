require 'spec_helper'
require 'pry'

RSpec.describe Year2020::Day04 do
  it 'solves part1' do
    content = File.read("#{__dir__}/day-04").split("\n\n").map { |line| line.chomp.gsub("\n", ' ') }
    d = Year2020::Day04.new
    expect(d.part1(content)).to eq(247)
  end

  it 'solves part2' do
    content = File.read("#{__dir__}/day-04").split("\n\n").map { |line| Hash[line.split.map { |e| e.split(':') }] }
    d = Year2020::Day04.new
    expect(d.part2(content)).to eq(145)
  end
end
