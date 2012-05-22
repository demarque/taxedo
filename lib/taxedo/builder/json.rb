require 'json'

class Taxedo::Builder::Json < Taxedo::Builder::Hash
  def generate
    super.to_json
  end
end
