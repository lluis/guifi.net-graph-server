require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting guifi_graph_server plugin for Initr'

Initr::Plugin.register :guifi_graph_server do
  redmine do
    name 'guifi_graph_server'
    author 'Ingent'
    description 'GuifiGraphServer plugin for initr'
    version '0.0.1'
    project_module :initr do
      permission :configure_guifi_graph_server,
        { :guifi_graph_server => [:configure] },
        :require => :member
    end
  end
  klasses 'guifi_graph_server' => 'Servidor de gràfiques'
end
