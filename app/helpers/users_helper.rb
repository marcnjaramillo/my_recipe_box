module UsersHelper  
  def profile_image user
    image = user.profile_image.present? ? user.profile_image : "default.png"
    image_tag(image, class: "profile-pic m-r-10")
  end

  def follow_image user
    image = user.profile_image.present? ? user.profile_image : "default.png"
    image_tag(image, class: "follow-pic m-r-10")
  end

  def can_edit_profile? profile_id
    user_signed_in? && current_user.id == profile_id
  end
end