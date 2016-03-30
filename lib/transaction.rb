class Transaction
  attr_reader :id,:product,:customer
  @@id = 1
  @@transactions =[]

  def initialize(customer, product)
    @product = product
    @customer = customer
    @id = @@id
    @@id = @@id + 1
    consume
  end

  def self.all
    @@transactions
  end

  def self.find(position)
    @@transactions.each do |transaction|
      if transaction.id == position
        return transaction
      end
    end
    raise CustomerNotFoundError, "#{customer.name} is not on the list."
  end

  private
  def consume
    @product.stock-=1
    @@transactions << self
  end
end
