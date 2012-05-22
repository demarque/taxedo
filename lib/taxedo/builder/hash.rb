class Taxedo::Builder::Hash < Taxedo::Builder::Base
  def generate
    { subtotal: subtotal, taxes: generate_taxes, total: total }
  end

  def generate_taxes
    taxes.map{ |t| generate_tax t }
  end

  def generate_tax(tax)
    { id: tax.id, name: tax.name, amount: tax.amount }
  end
end
