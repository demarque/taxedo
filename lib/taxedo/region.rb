require 'time'

class Taxedo::Region
  def initialize(id)
    @id = id
    @data = YAML.load_file(Taxedo.base_data_path + "regions.yml")['taxedo']['regions'][@id]
  end

  def calculate(amount, options={})
    options = { :on => Time.now, :rule => 'standard' }.merge(options)

    receipt = Taxedo::Receipt.new(@id, amount)
    receipt.currency = @data['currency']

    taxes(options[:rule], options[:on]).each do |tax|
      receipt.add_tax tax[0], tax[1]
    end

    return receipt
  end

  private

  def tax_from_start_date(tax_id, start_at)
    selection = Time.at(0)

    @data['taxes'][tax_id].each do |tax_start_at, tax_rate|
      tax_start_at = Time.parse(tax_start_at.to_s)
      selection = tax_start_at if tax_start_at <= start_at and tax_start_at > selection
    end

    return selection.strftime('%Y%m%d').to_i
  end

  def taxes(rule, start_at)
    @data['rules'][rule].map do |tax_id|
      tax_key = tax_from_start_date(tax_id, start_at)

      [tax_id, @data['taxes'][tax_id][tax_key]]
    end
  end
end