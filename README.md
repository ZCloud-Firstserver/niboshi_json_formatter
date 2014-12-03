# NiboshiJsonFormatter

[![Circle CI](https://circleci.com/gh/ZCloud-Firstserver/niboshi_json_formatter/tree/master.svg?style=svg)](https://circleci.com/gh/ZCloud-Firstserver/niboshi_json_formatter/tree/master)

A Ruby gem that makes your app log in JSON format. It may be useful if you ship all your logs to [ElasticSearch](http://www.elasticsearch.org/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'niboshi_json_formatter', github: "ZCloud-Firstserver/niboshi_json_formatter"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install niboshi_json_formatter

## Usage

Add this to your `config/environments/*.rb` files:

```
config.log_formatter = Niboshi::JsonFormatter.new
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/niboshi_json_formatter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
