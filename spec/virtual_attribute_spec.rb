require 'spec_helper'

class Model
  include Virtribute::DSL

  attr_accessor :first_name, :last_name, :price_a_int, :price_b_int

  virtual_attribute :name do
    read do
      "#{first_name} #{last_name}"
    end

    write do |value|
      self.first_name, self.last_name = value.split
    end
  end

  virtual_attribute :title do
    read { name.split.map(&:capitalize).join(' ') }
  end

  virtual_attributes :price_a, :price_b do
    real_attribute_name = "#{name}_int"
    read { send(real_attribute_name).to_f / 100 }
    write { |value| send("#{real_attribute_name}=",  (value * 100).to_i) }
  end

end

describe Virtribute do

  let!(:model) { Model.new }

  describe '#virtual_attribute' do

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

    context 'only read' do
      it 'does not need a write' do
        model.first_name = 'first'
        model.last_name = 'last'
        model.title.should == 'First Last'
      end
    end
  end

  describe '#virtual_attributes' do

    it 'creates a writer and reader for each attribute' do
      model.price_a = 12.34
      model.price_a.should == 12.34
      model.price_b = 23.45
      model.price_b.should == 23.45
    end

    it 'modifies the correct real attributes' do
      model.price_a = 12.34
      model.price_a_int = 1234
    end
  end

end
