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
    def self.parse(config)
      db_credentials = File.readlines config
      configuration = db_credentials.find_all do |cr|
        cr =~ /define\('DB_/
      end.inject({}) do |acc, e|
        f = e.match(/define\('(.*)', '(.*)'\).*$/)
        acc.merge({f[1] => f[2]})
      end
      {:username => configuration['DB_USER'], :password => configuration['DB_PASSWORD'], :database => configuration['DB_HOST']}
    end

  module Prestashop
    def self.parse(config)
      db_credentials = File.readlines config
      configuration = db_credentials.find_all do |cr|
        cr =~ /define\('_DB/
      end.inject({}) do |acc, e|
        f = e.match(/define\('(.*)', '(.*)'\).*$/)
        acc.merge({f[1] => f[2]})
      end
      {:username => configuration['_DB_USER_'], :password => configuration['_DB_PASSWD_'], :database => configuration['_DB_NAME_']}
    end
  end
end
