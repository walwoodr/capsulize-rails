require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ClothingItemsHelper. For example:
#
# describe ClothingItemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ClothingItemsHelper, type: :helper do
  let (:pants) {create(:pants)}
  let (:jeans1) {create(:jeans, category: pants, fanciness: 1)}
  let (:jeans2) {create(:jeans, category: pants, fanciness: 2)}
  let (:jeans3) {create(:jeans, category: pants, fanciness: 3)}
  let (:jeans4) {create(:jeans, category: pants, fanciness: 4)}
  let (:jeans5) {create(:jeans, category: pants, fanciness: 5)}
  it 'renders fanciness level as words' do
    expect(word_fanciness(jeans1)).to eq("scruffy")
    expect(word_fanciness(jeans2)).to eq("comfy")
    expect(word_fanciness(jeans3)).to eq("nice")
    expect(word_fanciness(jeans4)).to eq("spiffy")
    expect(word_fanciness(jeans5)).to eq("fancy")
  end

  it 'renders all clothing attributes' do
    expect(attributes_display(jeans1)).to eq("#{jeans1.name} | #{jeans1.color} | #{word_fanciness(jeans1)}")
  end
end
