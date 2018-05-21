require "spec_helper"

RSpec.describe Luhn, type: :model do
  describe 'is_valid? should work' do
    context 'with valid number' do

      it 'should return true' do
        expect(Luhn.is_valid?(4194560385008504)).to be true
      end

      it 'should return true if the number is valid and the number has an odd number of digits' do
        expect(Luhn.is_valid?(377681478627336)).to be true
      end
    end

    context 'with invalid number' do
      it 'should return false if the number is not valid' do
        expect(Luhn.is_valid?(4194560385008505)).to be false
      end

      it 'should return false if the number is not valid and the number has an odd number of digits' do
        expect(Luhn.is_valid?(377681478627337)).to be false
      end
    end
  end
end
