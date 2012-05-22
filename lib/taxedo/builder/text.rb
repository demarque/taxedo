class Taxedo::Builder::Text < Taxedo::Builder::Base
  def generate
    line t('subtotal'), subtotal
    taxes.each { |tax| line tax.name, tax.amount }
    line t('total'), total

    return @content.join("\n")
  end

  private

  def line(label, value)
    @content << (label + ' ').ljust(15, '.') + ' ' + price(value).rjust(6)
  end
end
