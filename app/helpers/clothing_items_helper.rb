module ClothingItemsHelper

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
  # scruffy
  # comfy
  # nice
  # spiffy
  # fancy

end
