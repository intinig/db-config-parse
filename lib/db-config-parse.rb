require "db-config-parse/version"
require "uri"

module DBConfig
  module Drupal
    def self.parse(config)
      db_credentials = File.readlines config
      configuration = db_credentials.find_all do |cr|
        cr =~ /^\$db_url =/
      end.first.split('=').last.match(/'(.*)';/)[1]
      configuration = URI.parse(configuration)
      {:username => configuration.user, :password => configuration.password, :database => configuration.path[1..-1]}
    end
  end

  module Wordpress

  end

  module Prestashop

  end
end
