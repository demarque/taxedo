class Taxedo::Tax
  attr_accessor :name, :rate
  attr_reader :id, :source_amount

  def initialize(id)
    @id = id
    @amount = 0
  end

  def amount
    @amount
  end

  def source_amount=(sa)
    @source_amount = sa
    @amount = calculate_amount
  end

  def subtotal
    @source_amount + @amount
  end

  private

  def calculate_amount
    ((@source_amount * @rate).to_f / 10000).round
  end
end
