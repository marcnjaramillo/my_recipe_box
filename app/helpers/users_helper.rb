module UsersHelper  
  def profile_image user, width = 200, height = 200
    image = user.profile_image.present? ? user.profile_image : "default.png"
    image_tag(image, width: width, height: height, class: "profile-pic m-r-10")
  end

  def can_edit_profile? profile_id
    user_signed_in? && current_user.id == profile_id
  end
end