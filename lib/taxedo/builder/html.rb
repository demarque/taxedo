class Taxedo::Builder::Html < Taxedo::Builder::Base
  def generate(format, options={})
    case format
      when :lines then lines
      when :rows then table_rows options[:columns], options[:custom_content]
      else table
    end

    @content = @content.join("\n")
    @content = @content.html_safe if @content.respond_to? :html_safe

    return @content
  end

  private

  def lines
    line t('subtotal'), subtotal, :class => 'subtotal'
    taxes.each { |tax| line tax.name, tax.amount, :class => "tax #{tax.id}" }
    line t('total'), total, :class => 'total'
  end

  def line(label, value, options={})
    options = { :class => '' }.merge(options)

    @content << ('<div class="line ' + options[:class] + '"><label>' + label + '</label><span>' + price(value) + '</span></div>')
  end

  def table
    @content << '<table class="receipt-footer"><tbody>'
    table_rows
    @content << '</tbody></table>'
  end

  def table_rows(columns=0, custom_content='')
    table_row t('subtotal'), subtotal, :class => 'subtotal', :custom_columns => columns, :custom_content => custom_content
    taxes.each { |tax| table_row tax.name, tax.amount, :class => "tax #{tax.id}" }
    table_row t('total'), total, :class => 'total'
  end

  def table_row(label, value, options={})
    options = { :class => '', :custom_columns => 0, :custom_content => '' }.merge(options)

    content = ['<tr class="' + options[:class] + '">']
    content << '<td class="custom" rowspan="4" colspan="' + options[:custom_columns].to_s + '">' + options[:custom_content] + '</td>' if options[:custom_columns] > 0
    content << '<td class="label">' + label + '</td><td class="value">' + price(value) + '</td></tr>'

    @content << content.join
  end

end
