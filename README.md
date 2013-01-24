# VirtualAttribute

Small DSL for defining virtual attributes.

## Installation

Add this line to your application's Gemfile:

    gem 'virtribute'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install virtribute

## Usage

```ruby
class Model
  include Virtribute::DSL

  attr_accessor :first_name, :last_name

  virtual_attribute :name do
    read do
      "#{first_name} #{last_name}"
    end

    write do |value|
      self.first_name, self.last_name = value.split
    end
  end

  virtual_attributes :price_a, :price_b do
    real_attribute_name = "#{name}_int"
    read { send(real_attribute_name).to_f / 100 }
    write { |value| send("#{real_attribute_name}=",  (value * 100).to_i) }
  end
end
```
