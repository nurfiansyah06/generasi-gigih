require_relative 'Models/order.rb'

class OrderController
    def create_order(params)
        order =Order.new({
            reference_no: params['reference_no'],
            customer_name: params['customer_name'],
            date: params['date']
        })
        order.save
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def list_orders
        order = Order.get_all_orders
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def create_order_form
        renderer = ERB.new(File.read("./views/create_order.erb"))
        renderer.result(binding)
    end
end