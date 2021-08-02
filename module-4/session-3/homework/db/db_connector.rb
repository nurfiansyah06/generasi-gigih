require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "vianos",
        :password => "root",
        :database => "food"
    )
    client
end