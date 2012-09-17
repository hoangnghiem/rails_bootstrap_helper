require "rails_bootstrap_helper/version"

module RailsBootstrapHelper
  module Rails
    if ::Rails.version < "3.1"
      require "rails_bootstrap_helper/railtie"
    else
      require "rails_bootstrap_helper/engine"
    end
  end
end