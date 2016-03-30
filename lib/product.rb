class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    # hmm...
    @@products.each do |product|
      if product.title == @title
        raise DuplicateProductError, "#{product.title} already exists. (DuplicateProductError)."
      end
    end
    @@products << self
  end
end
