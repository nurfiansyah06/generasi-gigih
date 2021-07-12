require 'sinatra'

# get '/messages' do 
#     "<h1 style=\"background:blue;\">Hello World!</h1>"
# end

# get '/messages/:name' do
#     name = params['name']
#     "<h1 style=\"background:blue;\">Hello #{name}!</h1>"
# end

# get '/messages/:name' do
#     name = params['name']
#     color = params['color'] ? params['color'] : 'DodgerBlue'
#     "<h1 style=\"background-color:#{color};\">Hello #{name}!</h1>"
# end

get '/messages/:name' do
    name = params['name']
    erb :messages, locals: {
        name: name
    }
end

post '/login' do
    if params['username'] == 'admin'
        return 'logged in'
    else
        redirect '/login'
    end
end

get '/login' do
    erb :form
end

post '/item' do
    listItem = {:name, :harga}
    nama = params['nama']
    harga = params['harga']
    if nama == "" && harga == ""
        redirect '/item'
    else 
        return listItem << {:name => nama, :harga => harga}
    end
end

get '/item' do
    erb :formItem
end