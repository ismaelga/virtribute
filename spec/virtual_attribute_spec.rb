require 'spec_helper'

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

describe VirtualAttribute do
  let!(:model) { Model.new }

  it 'creates a reader for the attribute' do
    model.first_name = 'first'
    model.last_name = 'last'

    model.name.should == 'first last'
  end

  it 'creates a writes for the attribute' do
    model.name = "new name"

    model.first_name.should == 'new'
    model.last_name.should == 'name'
  end
end
