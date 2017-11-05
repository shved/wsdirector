# frozen_string_literal: true

require "wsdirector/protocols/base"
require "wsdirector/protocols/action_cable"

module WSDirector
  ID2CLASS = {
    "base" => "Base",
    "action_cable" => "ActionCable"
  }.freeze

  module Protocols # :nodoc:
    class << self
      def get(id)
        raise Error, "Unknown protocol: #{id}" unless ID2CLASS.key?(id)
        class_name = ID2CLASS.fetch(id)
        const_get(class_name)
      end
    end
  end
end
