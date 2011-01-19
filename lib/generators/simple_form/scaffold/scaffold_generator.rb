require 'generators/simple_form'
require 'rails/generators/resource_helpers'

module SimpleForm
  module Generators
    class ScaffoldGenerator < Base
      include Rails::Generators::ResourceHelpers

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      class_option :template_engine

      def copy_form_file
        # form partial
        filename = filename_with_extensions("_form")
        template template_filename_with_extensions("_form"), File.join("app/views", controller_file_path, filename)
        # shared form errors partial
        filename = filename_with_extensions("_form_errors")
        template template_filename_with_extensions("_form_errors"), File.join("app/views", "shared", filename)
      end

      protected

        def handler
          options[:template_engine].to_s.gsub('erubis', 'erb')
        end
    end
  end
end
