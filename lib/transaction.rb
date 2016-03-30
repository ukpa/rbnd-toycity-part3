class Transaction
  attr_reader :id,:product,:customer,:time_of_purchase
  @@id = 1
  @@transactions =[]

  def initialize(customer, product)
    @product = product
    @customer = customer
    @time_of_purchase = Time.now
    @id = @@id
    @@id = @@id + 1
    consume
  end

  def self.all

    @@transactions
  end

  def self.in_detail
    puts "----------------------------------------------------------------------------------------"
    puts "Previous Transactions - #{@@transactions.count}"
    puts "-------------------------"
    rev =0
    @@transactions.each do |transaction|
      puts "#{transaction.customer.name} | #{transaction.product.title}-#{transaction.product.price}$ | #{transaction.time_of_purchase} "
      rev+=transaction.product.price
    end
    puts "-------------------------"
    puts "Total revenue: #{rev}$"
    puts "----------------------------------------------------------------------------------------"
  end

  def self.find(position)
    @@transactions.each do |transaction|
      if transaction.id == position
        return transaction
      end
    end
    puts "#{transaction.id} is not on the list."
  end

  private
  def consume
    @product.stock-=1
    @@transactions << self
  end
end
