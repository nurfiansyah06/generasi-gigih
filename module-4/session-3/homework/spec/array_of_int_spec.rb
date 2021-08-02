require_relative '../src/array_of_int'

RSpec.describe ArrayInt do
    it 'returns [5,6,2]' do
        array_of_int = ArrayInt.new

        result = array_of_int.sum([5,6,1])

        expect(result).to eq([5,6,2])
    end

    it 'returns [3,2]' do
        array_of_int = ArrayInt.new

        result = array_of_int.sum([3,1])

        expect(result).to eq([3,2])
    end

    it 'returns [8]' do
        array_of_int = ArrayInt.new

        result = array_of_int.sum([7])

        expect(result).to eq([8])
    end

    it 'returns [1,0]' do
        array_of_int = ArrayInt.new

        result = array_of_int.sum([9])

        expect(result).to eq([1,0])
    end
end