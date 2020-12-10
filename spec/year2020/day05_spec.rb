require 'spec_helper'

RSpec.describe Year2020::Day05 do
  content = []
  before(:all) { content = File.open("#{__dir__}/day-05").readlines.map(&:chomp) }
  it 'solves part1' do
    d = Year2020::Day05.new
    expect(d.part1(content)).to eq(994)
  end

  it 'solves part2' do
    d = Year2020::Day05.new
    expect(d.part2(content)).to eq(741)
  end
end

# BBBFBFFRLR
# front = 0
# back = 127
# B - front = 127 - ((127 - 0) / 2) == 64
# B - front = 127 - ((127 - 64) / 2) ==  96
# B - front = 127 - ((127 - 96) / 2) == 112
# front = 112
# back = 127
# F - back = 112 + ((127 - 112) / 2) == 119
# front = 112
# back = 119
# B - front = 119 - ((119 - 112) / 2) == 116
# front = 116
# back = 119
# F - back = 116 + ((119 - 116) / 2) == 117
# front = 116
# back = 117
# F - back = 117 + ((117 - 116) / 2)  = 116

# B => front = back - ((back - front) / 2)
# F => back = front + (back - front) / 2)

# RLR
# left = 0
# right = 7

# R - left = 7 - ((7 - 0) / 2)
# left = 4
# L - right = 4 + ((7 - 4) / 2)

# R => left = right - ((right - left) / 2)
# L => right = left + (right - left) / 2)

Tip: Based on detected gems, the following RuboCop extension libraries might be helpful:
  * rubocop-rspec (http://github.com/rubocop-hq/rubocop-rspec)

You can opt out of this message by adding the following to your config (see https://docs.rubocop.org/rubocop/extensions.html#extension-suggestions for more options):
  AllCops:
    SuggestExtensions: false
