module ApplicationHelper

  def show_update_user_profile
    content_tag :div, class: "alert alert-info" do
      "Please update your profile here: #{link_to('Update Profile' ,edit_user_path(current_user))}".html_safe
    end if check_if_user_has_complete_profile
  end
  
end
