require './db/db_connector'

class Order
    attr_accessor :reference_no, :customer_name, :date

    def initialize(params)
        @reference_no = params[:reference_no]
        @customer_name = params[:customer_name]
        @date = params[:date]
    end

    def self.get_all_orders
        client = create_db_client
        rawData = client.query("SELECT * FROM orders")
        orders = Array.new
        rawData.each do |data|
            order = Order.new(data["reference_no"],data["customer_name"], data["date"])
            orders.push(order)
        end
        orders
    end

    def save
        return false if unless valid?
        client = create_db_client
        client.query("INSERT INTO orders(reference_no, customer_name, date) VALUES ('#{reference_no}','#{customer_name}','#{date}')")
    end

    def valid?
        return false if @reference_no.nil?
        return false if @customer_name.nil?
        return false if @date.nil?
        true
    end
end