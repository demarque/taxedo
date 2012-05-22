require 'taxedo/implants/action_controller'

module Taxedo::Implants
  class Railtie < Rails::Railtie
    initializer "taxedo" do |app|

      ActiveSupport.on_load :action_controller do
        include Taxedo::Implants::ActionController
      end

    end
  end
end
