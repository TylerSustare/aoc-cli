module Year2020
  class Day06
    def part1(input)
      input.reduce(0) do |total, answers|
        total += answers.reduce(Set[]) { |group_answers, answer| group_answers.merge(answer) }.count
      end
    end

    def part2(input)
      input.reduce(0) do |total, answers|
        total += answers.reduce { |group_answers, answer| group_answers = group_answers.intersection(answer) }.count
      end
    end
  end
end
