module SimpleForm
  module Helpers
    module Required
      # Whether this input is valid for HTML 5 required attribute.
      def has_required?
        attribute_required?
      end

      private

      def add_required!
        input_html_options[:required] = true if has_required?
      end

      def attribute_required?
        @required
      end

      def calculate_required
        if !options[:required].nil?
          options[:required]
        elsif has_validators?
          (attribute_validators + reflection_validators).any? do |v|
            v.kind == :presence && valid_validator?(v)
          end
        else
          attribute_required_by_default?
        end
      end

      def attribute_required_by_default?
        SimpleForm.required_by_default
      end

      def required_class
        attribute_required? ? :required : :optional
      end
    end
  end
end