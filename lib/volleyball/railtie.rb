# encoding: utf-8
require 'volleyball'
require 'rails'

class Railtie < ::Rails::Railtie
  initializer "volleyball.on_rails_init" do
    ActiveSupport.on_load :active_record do
      ActiveRecord::Base.send :include, Volleyball::Base
    end
  end
end
