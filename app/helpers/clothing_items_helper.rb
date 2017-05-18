module ClothingItemsHelper

  # // Note: this function is replicated by the wordFanciness function in clothing_item.js
  def word_fanciness(clothing_item)
    case clothing_item.fanciness
    when 1
      "scruffy"
    when 2
      "comfy"
    when 3
      "nice"
    when 4
      "spiffy"
    when 5
      "fancy"
    end
  end

  # // Note: this function is replicated by the attributesDisplay function in clothing_item.js
  def attributes_display(clothing_item)
    "#{clothing_item.name} | #{clothing_item.color} | #{word_fanciness(clothing_item)}"
  end

end
