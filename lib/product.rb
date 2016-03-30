class Product
  attr_reader :title, :price, :stock
  attr_writer :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.product_list
    @@products.each do |product|
      puts "Name: #{product.title} | Price per piece: #{product.price} | In Stock: #{product.stock}"
    end
  end

  def self.find_by_title(name)
    @@products.each do |product|
      if product.title == name
        return product
      end
    end
    puts "#{name} is currently not available in the inventory."
  end

  def in_stock?
    return @stock>0
  end

  def self.in_stock
    @@products.each {|product| product.in_stock?}
  end
  private

  def add_to_products
    @@products.each do |product|
      if product.title == @title
        raise DuplicateProductError, "#{product.title} already exists. (DuplicateProductError)."
      end
    end
    @@products << self
  end



end
