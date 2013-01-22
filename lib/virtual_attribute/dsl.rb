require 'active_support'

require 'virtual_attribute/definition'

module VirtualAttribute
  module DSL
    extend ActiveSupport::Concern

    module ClassMethods
      def virtual_attribute(name, &block)
        Definition.define(self, name, &block)
      end
    end
  end
end
