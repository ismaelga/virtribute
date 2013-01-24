require 'active_support'

require 'virtribute/definition'

module Virtribute
  module DSL
    extend ActiveSupport::Concern

    module ClassMethods
      def virtual_attribute(name, &block)
        Definition.define(self, name, &block)
      end

      def virtual_attributes(*names, &block)
        klass = self
        names.each do |name|
          Definition.define(klass, name, &block)
        end
      end
    end
  end
end
