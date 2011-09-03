module SimpleForm
  module Helpers
    # Helper methods for maxlength.
    module Maxlength #:nodoc:
      def has_maxlength?
        true
      end

      private

      def add_maxlength!
        input_html_options[:maxlength] ||= maximum_length_from_validation || limit if has_maxlength?
      end

      def maximum_length_from_validation
        return unless has_validators?

        length_validator = find_length_validator or return
        length_validator.options[:maximum]
      end

      def find_length_validator
        attribute_validators.find { |v| ActiveModel::Validations::LengthValidator === v }
      end
    end
  end
end
