module Taxedo::Implants::ActionController
  extend ActiveSupport::Concern

  included do
    helper_method :tax_for
  end

  def tax_for(region_id, amount, options={})
    Taxedo.tax_for region_id, amount, options
  end
end
