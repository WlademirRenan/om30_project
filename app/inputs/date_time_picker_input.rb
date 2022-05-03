class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    set_value_html_option

    template.content_tag(:div, class: 'input-group date datetimepicker') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_table
    end
  end

  def input_html_options
    classes = (super[:class] || [])
    classes << :'form-control'
    classes << 'input-group-addon'
    classes.uniq!
    options = super
    options.merge({class: classes})
    options.merge({readonly: false}) unless options[:readonly]
    options
  end

  def span_table
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_table
    end
  end

  def icon_table
    "<span class='glyphicon glyphicon-calendar'></span>".html_safe
  end

  def set_value_html_option
    return unless value.present?
    input_html_options[:value] ||= I18n.localize(value, format: display_pattern)
  end

  def value
    object.send(attribute_name) if object.respond_to? attribute_name
  end

  def display_pattern
    I18n.t('datepicker.dformat', default: '%d/%m/%Y')
  end
end
  