require 'sinatra'
require_relative 'db_connector'

get '/' do
    items = get_all_item_categories
    erb :index, locals:{
        items: items,
    }
end

get '/items/new' do
    categories = get_all_categories
    erb :create, locals: {
        categories: categories
    }
end

post '/items/create' do
    name = params['name']
    price = params['price']
    category_id = params['category_id']
    insert_item_categories(name,price,category_id)
    redirect '/'
end

get '/items/:id' do
    detail_item = detail_item(params['id'])
    erb :detail, locals: {
        detail_item: detail_item
    }
end

get '/items/:id/edit' do
    detail_item = detail_item(params['id'])
    erb :edit, locals: {
        detail_item: detail_item
    }
end

delete '/items/:id' do 
    id = params['id']
    delete_item(id)
    redirect '/'
end

put '/items/update' do 
    name = params['name']
    price = params['price']
    category_id = params['category_id']
    item_id = params['item_id']
    update_item_categories(name, price, item_id, category_id)
    redirect '/'
end