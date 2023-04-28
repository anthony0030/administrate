require "administrate/field/base"

module Administrate
  module Field
    class RichText < Administrate::Field::Base
      def to_s
        data.to_plain_text
      end
    end
  end
end
