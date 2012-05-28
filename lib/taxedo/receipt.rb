class Taxedo::Receipt
  attr_accessor :currency

  def initialize(region_id, amount)
    @region_id = region_id
    @amount = amount
    @taxes = []

    load_translations
  end

  def add_tax(id, rate)
    tax = Taxedo::Tax.new(id)
    tax.name = tax_name(id)
    tax.rate = rate
    tax.source_amount = (@taxes.empty? ? @amount : @taxes.last.subtotal)

    @taxes << tax
  end

  def language
    defined?(I18n) ? I18n.locale.to_s : 'fr'
  end

  def subtotal
    @amount
  end

  def t(path)
    text = @translations

    path.split('.').each do |p|
      raise "TAXEDO: No #{language} translation for #{path}." if not text
      text = text[p]
    end

    return text.to_s
  end

  def taxes
    @taxes
  end

  def total
    @total = subtotal
    @taxes.each { |t| @total += t.amount }

    return @total
  end

  def to_hash
    Taxedo::Builder::Hash.new(self).generate
  end

  def to_html(options={})
    options = { columns: 0, custom_content: '', template: :table }.merge(options)

    return Taxedo::Builder::Html.new(self).generate(options[:template], options)
  end

  def to_json
    Taxedo::Builder::Json.new(self).generate
  end

  def to_text
    Taxedo::Builder::Text.new(self).generate
  end

  private

  def load_translations
    @translations = YAML.load_file(Taxedo.base_languages_path + "#{language}.yml")['taxedo'][language]
  end

  def tax_name(tax_id)
    t("regions.#{@region_id}.taxes.#{tax_id}.short")
  end
end
