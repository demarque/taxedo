module Taxedo
  def self.base_path(name)
    File.expand_path("../../#{name}", __FILE__) + '/'
  end

  def self.base_data_path
    base_path 'data'
  end

  def self.base_languages_path
    base_path 'languages'
  end

  def self.region(region_id)
    Taxedo::Region.new(region_id)
  end

  def self.tax_for(region_id, amount, options={})
    options = { format: :text, on: Time.now, rule: 'standard', html_options: {} }.merge(options)

    receipt = Taxedo.region(region_id).calculate(amount, on: options[:on], rule: options[:rule])

    return case options[:format]
      when :hash then receipt.to_hash
      when :html then receipt.to_html options[:html_options]
      when :json then receipt.to_json
      else receipt.to_text
    end
  end
end

['region', 'receipt', 'tax', 'builder', 'implants'].each { |f| require "taxedo/#{f}"}
