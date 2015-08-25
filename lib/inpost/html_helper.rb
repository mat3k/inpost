module Inpost
  module HtmlHelper

    EDITABLE_ATTRIBUTES = %i(id class)

    class << self
      def machine_select_tag(collection: [], attributes: {})
        select_tag_template = "<select%s>%s</select>"
        option_tag_template = "<option id='%s'>%s</option>"

        select_options = collection.reduce('') do |agg, machine|
          option_label = "%s, %s (%s)" % [machine['city'], machine['street'], machine['province']]
          option_value = machine['id']
          agg += option_tag_template % [option_value, option_label]
        end

        setable_attributes = attributes.select do |k,v|
          EDITABLE_ATTRIBUTES.include?(k)
        end

        select_attributes = setable_attributes.reduce('') do |agg,(key, value)|
          agg += " %s='%s'" % [key, value]
        end || ''

        result_html = select_tag_template % [select_attributes, select_options]

        result_html
      end

    end
  end
end