module OutfitsHelper

  def items_div_class(outfit)
    if outfit.clothing_items.size < 2 && outfit.errors.size > 0
       "div_with_errors clothing_items_by_category"
    else
      "clothing_items_by_category"
    end
  end

  def outfit_error_message(outfit)
    if outfit.clothing_items.size < 2 && outfit.errors.size > 0
      content_tag(:p, "Your outfit must include at least two items of clothing.")
    end
  end

  def delete_link(user, outfit)
    if outfit.persisted?
      link_to("Delete outfit", user_outfit_path(user, outfit), method: "delete", class: "delete-outfit-link")
    end
  end

  def outfit_item_error(item)
    if item.errors.size > 0
      content_tag(:div, item.errors.full_messages.join(", "), class: "alert-flash")
    end
  end

end
