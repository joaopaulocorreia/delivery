module Auth
  module ApplicationHelper
    def input_error_css(errors, field) = class_names('is-danger': errors.has_key?(field))
    def input_error_message(errors, field)
      tag.p(class: "help is-danger") { errors[field].first } if errors.has_key?(field)
    end
  end
end
