class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def first_name
    return object.first_name if object.first_name
    if object.formatted_name
      object.formatted_name.split[0]
    end
  end

  def last_name
    return object.last_name if object.last_name
    if object.formatted_name
      object.formatted_name.split[-1]
    end
  end
end
