# encoding: utf-8
module Taxedo::Builder::Price

  def self.currency_symbol(unit)
    return case unit.downcase
      when 'cad', 'usd' then '$'
      when 'eur' then '€'
      when 'chf' then 'CHF'
      else ''
    end
  end

  def self.price(amount, options={})
    options = { separator: ',', format: '%n%u', unit: 'cad' }.merge(options)

    result = amount.to_s.rjust(3,'0')
    result = result[0..-3] + options[:separator] + result[-2..-1]
    result = options[:format].gsub('%u', currency_symbol(options[:unit])).gsub('%n', result) if options[:unit]

    return result
  end

end
