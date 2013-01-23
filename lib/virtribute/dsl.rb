require 'active_support'

require 'virtribute/definition'

module Virtribute
  module DSL
    extend ActiveSupport::Concern

    module ClassMethods
      def virtual_attribute(name, &block)
        Definition.define(self, name, &block)
      end
    end
  end
end
