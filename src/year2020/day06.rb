module Year2020
  class Day06
    def part1(input)
      result = 0
      input.each do |answers|
        merged_answers = Set[]
        answers.each do |answer|
          merged_answers.merge(answer)
        end
        result += merged_answers.count
      end
      result
    end

    def part2(input)
      result = 0
      input.each do |answers|
        intersection_answers = nil
        answers.each do |answer|
          intersection_answers ||= answer
          intersection_answers = intersection_answers.intersection(answer)
        end
        result += intersection_answers.count
      end
      result
    end
  end
end
