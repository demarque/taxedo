module Taxedo::Builder

end

['base', 'hash', 'html', 'json', 'text', 'price'].each { |f| require "taxedo/builder/#{f}" }
