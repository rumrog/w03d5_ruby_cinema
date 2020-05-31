require_relative('../db/sql_runner.rb')

class Ticket

attr_reader :id
attr_accessor :film_id, :customer_id

def initialize(options)
  @id = options["id"].to_i if options["id"]
  @title = options["title"]
  @price = options["price"].to_i
end

def save()
  sql = "INSERT INTO tickets
  (
    film_id,
    customer_id
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@film_id, @customer_id]
  ticket = SqlRunner.run(sql, values).first
  @id = ticket['id'].to_i
end


end