class Product
  attr_reader :title, :price, :stock

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

  def self.find_by_title(name)
    @@products.each do |product|
      if product.title == name
        return product
      end
    end
    raise ItemNotFoundError, "#{product.title} is currently not available in the inventory."
  end

  def in_stock?
    return @stock>0
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
