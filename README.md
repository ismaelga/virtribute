# VirtualAttribute

Small DSL for defining virtual attributes.

## Installation

Add this line to your application's Gemfile:

    gem 'virtual_attribute'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install virtual_attribute

## Usage

```ruby
class Model
  include VirtualAttribute::DSL

  attr_accessor :first_name, :last_name

  virtual_attribute :name do
    read do
      "#{first_name} #{last_name}"
    end

    write do |value|
      self.first_name, self.last_name = value.split
    end
  end
end
```
