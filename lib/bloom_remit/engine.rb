module BloomRemit
  class Engine < ::Rails::Engine
    isolate_namespace BloomRemit

    config.to_prepare do
      Engine.routes.default_url_options =
        Rails.application.routes.default_url_options
    end

  end
end
