module Year2020
  class Day06
    def part1(input)
      input.reduce(0) do |total, answers|
        merged_answers = Set[]
        answers.each { |answer| merged_answers.merge(answer) }
        total += merged_answers.count
      end
    end

    def part2(input)
      input.reduce(0) do |total, answers|
        group_answers = nil
        answers.each do |answer|
          group_answers ||= answer
          group_answers = group_answers.intersection(answer)
        end
        total += group_answers.count
      end
    end
  end
end
