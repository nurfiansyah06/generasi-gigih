

describe ApplicationController do
    describe '#show' do
        it 'should show index page' do
            controller = ApplicationController.new
            
            response = controller.show

            expected_view = ERB.new(File.read("./views/index.erb"))
        end
    end
end