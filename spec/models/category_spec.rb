require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:attributes) do
    {name: "Pants", part_of_body: "legs"}
  end

  it 'is valid with a name and body part' do
    expect(Category.new(attributes)).to be_valid
  end

  it 'is invalid without a name' do
    expect(Category.new(part_of_body: "legs")).not_to be_valid
  end

  it 'is invalid without a body part' do
    expect(Category.new(name: "Pants")).not_to be_valid
  end

  it 'is valid with a valid body part' do
    expect(Category.new(part_of_body: "legs", name: "Pants")).to be_valid
    expect(Category.new(part_of_body: "torso", name: "Shirt")).to be_valid
    expect(Category.new(part_of_body: "wrist", name: "Bracelet")).to be_valid
  end

  it 'is invalid with an invalid body part' do
    expect(Category.new(part_of_body: "piano", name: "Pants")).not_to be_valid
    expect(Category.new(part_of_body: "elephant", name: "Shirt")).not_to be_valid
  end

  it 'has many clothing items' do
    pants = Category.create(attributes)
    pants.clothing_items.create
    pants.clothing_items.create

    expect(pants.clothing_items.size).to eq(2)
  end

  it 'has a name' do
    expect(Category.new(attributes).name).to eq(attributes[:name])
  end

  it 'has a part of the body' do
    expect(Category.new(attributes).part_of_body).to eq(attributes[:part_of_body])
  end
end
