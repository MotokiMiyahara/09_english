# vim:set fileencoding=utf-8 ts=2 sw=2 sts=2 et:


require 'tapp'
require 'pp'

module English
  class Translator
    WORDS_1_19 = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen',
    ].freeze

    WORDS_20_90 = [
      'Twenty',
      'Thirty',
      'Forty',
      'Fifty',
      'Sixty',
      'Seventy',
      'Eighty',
      'Ninety',
    ].freeze

    WORDS_1000_FACTOR = [
      nil,
      'Thousand',
      'Million',
      'Billion',
    ]

    WORD_ZERO = 'Zero'
    WORD_HUNDRED = 'Hundred'
    WORD_NEGATIVE = 'Negative'

    public

    def translate(n)
      unless supported_range.include?(n)
        raise "actural: n=#{n} expected:  (#{supported_range}) includes n "
      end
      return words_of_integer(n).join(' ')
    end

    # @return [Range<Integer>]
    def supported_range
      return (-supported_max_interger .. supported_max_interger)
    end

    def supported_max_interger
     return 1000 ** WORDS_1000_FACTOR.size - 1
    end
    
    def words_of_integer(n)
      if n == 0
        return [WORD_ZERO]
      elsif n < 0
        return [WORD_NEGATIVE] + words_of_positive_integer(-n)
      elsif 0 < n
        return words_of_positive_integer(n)
      else
        raise
      end
    end

    def words_of_positive_integer(n)
      digits_list = split_to_3_digits_list(n)

      result = digits_list.map.with_index {|digits, index|
        if digits == 0 
          next []
        elsif 0 < digits 
          i = digits_list.size - 1 - index
          next [words_of_1_999(digits), WORDS_1000_FACTOR[i]].compact
        end
      }
      return result.flatten
    end


    # 数値を三桁ごとに区切ります
    # @return [Array<Integer>]
    # @example
    #   split_to_3_digits_list(1234567) #=> [1, 234, 567]
    #   split_to_3_digits_list(1003567) #=> [1, 3, 567]
    #   split_to_3_digits_list(1000567) #=> [1, 0, 567]
    def split_to_3_digits_list(n)
      raise unless 0 < n
      digits = []
      x = n
      while 0 < x
        break if x == 0
        last_3_digits = x % 1000
        x = x / 1000
        digits << last_3_digits
      end
      return digits.reverse
    end

    def words_of_1_999(n)
      raise "actural: n=#{n} expected:  1 <= n && n <= 999" unless 1 <= n && n <= 999
      digit_100 = n / 100
      digit_rest = n % 100

      # 100の位
      figures_100 = nil
      if digit_100 == 0
        figures_100 = []
      elsif 0 < digit_100 
        figures_100 = [word_of_1_19(digit_100), WORD_HUNDRED]
      else
          raise digit_100.to_s
      end

      # 下二桁
      figures_rest = nil
      if digit_rest == 0
        figures_rest = []
      else
        figures_rest = words_of_1_99(digit_rest)
      end

      return figures_100 + figures_rest
    end

    def words_of_1_99(n)
      if 1 <= n && n <= 19
        return [word_of_1_19(n)]
      elsif n <= 99
        return words_of_20_99(n)
      else
        raise "actural: n=#{n} expected:  1 <= n && n <= 99" unless 1 <= n && n <= 99
      end
    end
      

    # @return [String]
    def word_of_1_19(n)
      raise "actural: n=#{n} expected:  1 <= n && n <= 19" unless 1 <= n && n <= 19
      return WORDS_1_19[n - 1]
    end

    # @return [Array<String>]
    def words_of_20_99(n)
      raise "actural: n=#{n} expected:  20 <= n && n <= 99" unless 20 <= n && n <= 99
      digit_1 = n % 10
      digit_10 = n / 10

      figure_1 = digit_1 == 0 ? nil : word_of_1_19(digit_1)
      figure_10 = WORDS_20_90[digit_10 - 2]

      return [figure_10, figure_1].compact
    end

    private 


  end

end


if $0 == __FILE__
  numbers = ARGF.readlines[1..-1].reject(&:empty?).map{|line| line.to_i}

  english = English::Translator.new
  numbers.each do |n|
    puts english.translate(n)
  end
end

