class Taxedo::Builder::Base
  def initialize(receipt)
    @receipt = receipt
    @content = []
  end

  def price(amount)
    Taxedo::Builder::Price.price(amount, unit: @receipt.currency)
  end

  def subtotal
    @receipt.subtotal
  end

  def t(path)
    @receipt.t(path)
  end

  def taxes
    @receipt.taxes
  end

  def total
    @receipt.total
  end
end
