# SchemaSerializer

[![Build Status](https://travis-ci.org/i2bskn/schema_serializer.svg?branch=master)](https://travis-ci.org/i2bskn/schema_serializer)

SchemaSerializer is provide serialization from schema definition to JSON.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "schema_serializer"
```

And then execute:

```bash
$ bundle install
```

Create config file(Only Rails) with:

```bash
$ bundle exec rails generate schema_serializer:install
```

The following file will be created.

- `config/initializers/schema_serializer.rb`
- `doc/schema.yml`

## Usage

### Create a serializer template with Rails Generator

Create a serializer template in `app/serializers/user_serializer.rb`.

```bash
$ bundle exec rails g schema_serializer:serializer User
```

### Serializer Definitions

Serializer Definitions are describe in the `doc/schema.yml`.

```yaml
User:
  required:
    - id
    - name
  properties:
    id:
      type: integer
    name:
      type: string
    age:
      type: integer
      nullable: true
```

### Serialization

```ruby
user = User.take
SchemaSerializer.new(user).as_json.to_json

# Only ActiveRecord Object
user.serializer.as_json.to_json
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/i2bskn/schema_serializer.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
