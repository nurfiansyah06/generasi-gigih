require_relative 'Models/order.rb'

class OrderController
    def create_order(params)
        order =Order.new({
            reference_no: params['reference_no'],
            customer_name: params['customer_name'],
            date: params['date']
        })
    end

    def list_orders
        
    end
end