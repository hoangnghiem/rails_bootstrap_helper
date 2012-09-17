require "rails_bootstrap_helper/helper"
module RailsBootstrapHelper
  module Rails
    class Engine < ::Rails::Engine
      initializer "rails_bootstrap_helper.view_helpers" do
        ActionView::Base.send :include, RailsBootstrapHelper::Helper
      end
    end
  end
end
