module Year2020
  class Day04
    REQUIRED_FIELDS = %w[byr iyr eyr hgt hcl ecl pid].sort.freeze

    def part1(input)
      input.count do |passport|
        passport.split(' ').map { |element| element[0..2] }.filter { |element| element != 'cid' }.sort == REQUIRED_FIELDS
      end
    end

    def part2(input)
      input.count do |element|
        valid_fields?(element) && valid_values?(element)
      end
    end

    private

    def valid_fields?(values)
      values.keys.filter { |e| e != 'cid' }.sort == REQUIRED_FIELDS
    end

    def valid_values?(values)
      valid_byr?(values['byr'].to_i) &&
        valid_iyr?(values['iyr'].to_i) &&
        valid_eyr?(values['eyr'].to_i) &&
        valid_hgt?(values['hgt']) &&
        valid_hcl?(values['hcl']) &&
        valid_ecl?(values['ecl']) &&
        valid_pid?(values['pid'])
    end

    def valid_byr?(year)
      year.between?(1920, 2002)
    end

    def valid_iyr?(year)
      year.between?(2010, 2020)
    end

    def valid_eyr?(year)
      year.between?(2020, 2030)
    end

    def valid_hgt?(value)
      is_inches = value.include?('in')
      is_cm = value.include?('cm')

      return false if !is_inches && !is_cm

      return value[0..(value.index('in'))].to_i.between?(59, 76) if is_inches
      return value[0..(value.index('cm'))].to_i.between?(150, 193) if is_cm
    end

    def valid_hcl?(color)
      color.match?(/#[0-9a-f]{6}/)
    end

    def valid_ecl?(color)
      %w[amb blu brn gry hzl oth grn].include?(color)
    end

    def valid_pid?(id)
      id.length == 9 && id.match?(/\A\d{9}\z/)
    end
  end
end
