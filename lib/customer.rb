class Customer
  attr_reader :name
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_customer
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.each do |customer|
      if customer.name == name
        return customer
      end
    end
    raise CustomerNotFoundError, "#{customer.name} is not on the list."
  end

  private
  def add_customer
    @@customers.each do |customer|
      if customer.name == @name
        raise DuplicateCustomerError, "#{customer.name} already exists. (DuplicateCustomerError)."
      end
    end
    @@customers << self
  end
end
