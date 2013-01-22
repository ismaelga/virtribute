require 'spec_helper'

class Model
  include VirtualAttribute::DSL

  attr_accessor :internal_name

  virtual_attribute :name do
    read do
      "the name"
    end

    write do |value|
      self.internal_name = value
    end
  end
end

describe VirtualAttribute do
  let!(:model) { Model.new }

  it 'creates a reader for the attribute' do
    model.name.should == "the name"
  end

  it 'creates a writes for the attribute' do
    model.name = "new name"

    model.internal_name.should == "new name"
  end
end
