# Db::Config::Parse

Parses configuration data from popular php packages for DB information so you can use it for Capistrano or anything you need it for.

## Installation

Add this line to your application's Gemfile:

    gem 'db-config-parse'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install db-config-parse

## Usage

require 'db-config-parse'

Db::Config::Drupal.parse("path/to/settings.inc.php")


You can also use DBConfig::Prestashop and DBConfig::Wordpress

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
