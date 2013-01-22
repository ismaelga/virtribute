module VirtualAttribute
  class Definition
    attr_accessor :type, :name

    def self.define(type, name, &block)
      definition = Definition.new(type, name)
      definition.instance_eval(&block)
    end

    def initialize(type, name)
      self.type = type
      self.name = name
    end

    def read(&block)
      self.type.send(:define_method, "#{self.name}", &block)
    end

    def write(&block)
      self.type.send(:define_method, "#{self.name}=", &block)
    end
  end
end
