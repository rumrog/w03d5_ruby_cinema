require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id, :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  def save() # CREATE
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end
 
  def self.all() # READ
    sql = "SELECT * FROM customers"
    customer_data = SqlRunner.run(sql)
    return Customer.map_items(customer_data)
  end
 
  def self.update() # UPDATE
    sql = "UPDATE customers SET 
    (
      name,
      funds
    )
    =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(customer_data)
    result = customer_data.map{|customer| Customer.new(customer)}
    return result
  end

end