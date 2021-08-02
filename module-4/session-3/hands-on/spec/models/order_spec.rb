require_relative '../../models/order'

describe Order do
    describe '#valid?' do
        context 'when initiliaze with valid input' do
            it 'should return true' do
                order = Order.new({
                    reference_no: "123",
                    customer_name: "tes",
                    date: "2021-02-02"
                })
                expect(order.valid?).to eq(true)
            end
        end
    end

    describe '#save' do
        context 'when initiliaze with valid input' do
            it 'should save to database' do
                order = Order.new({
                    reference_no: "123",
                    customer_name: "tes",
                    date: "2021-02-02"
                })
                order.save
            end
        end
    end

end