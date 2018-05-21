module Luhn
  def self.is_valid?(number)
    @card_number = number
    @card_array = separate_digits
    @every_other_doubled = double_every_other
    divisible_by_10?
  end

  private

  def self.divisible_by_10?
    total = @every_other_doubled.reduce(&:+)
    total % 10 == 0
  end

  def self.double_every_other
    @card_array.reverse.map.with_index do |digit, i|
      if i.odd?
        digit = digit * 2
        digit > 9 ? digit - 9 : digit
      else
        digit
      end
    end
  end

  def self.separate_digits
    @card_number.to_s.split('').map(&:to_i)
  end
end
