module Year2020
  class Day06
    def part1(input)
      result = 0
      input.each do |answers|
        group_answers = Set[]
        answers.each do |answer|
          group_answers.merge(answer)
        end
        result += group_answers.count
      end
      result
    end

    def part2(input)
      result = 0
      input.each do |answers|
        group_answers = nil
        answers.each do |answer|
          group_answers ||= answer
          group_answers = group_answers.intersection(answer)
        end
        result += group_answers.count
      end
      result
    end
  end
end
