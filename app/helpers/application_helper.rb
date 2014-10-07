module ApplicationHelper
  def user_login_links
    if user_signed_in?
      content_tag(:span, current_user.email, style: "color:#ba1812;") +
        (link_to "Edit", edit_user_registration_path) +
        (link_to "Log Out", destroy_user_session_path, method: :delete)
    else
      link_to "Log In/Sign Up", new_user_session_path
    end
  end

  def to_money(number)
    sprintf("$%0.02f", number)
  end
end
