module Luhn
  def self.is_valid?(number)
    divisible_by_10?(number)
  end

  private

  def self.divisible_by_10?(number)
    total = double_every_other(number).reduce(&:+)
    total % 10 == 0
  end

  def self.double_every_other(number)
    card_array = separate_digits(number)

    card_array.reverse.map.with_index do |digit, i|
      if i.odd?
        digit = digit * 2
        digit > 9 ? digit - 9 : digit
      else
        digit
      end
    end
  end

  def self.separate_digits(number)
    number.to_s.split('').map(&:to_i)
  end
end
