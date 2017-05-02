require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:attributes) do
    {name: "Pants"}
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
    expect(Category.new(name: "legs", name: "Pants")).to be_valid
    expect(Category.new(name: "torso", name: "Shirt")).to be_valid
    expect(Category.new(name: "wrist", name: "Bracelet")).to be_valid
  end

  it 'is invalid with an invalid body part' do
    expect(Category.new(name: "piano", name: "Pants")).not_to be_valid
    expect(Category.new(name: "elephant", name: "Shirt")).not_to be_valid
  end

  it 'has many clothing items' do
    expect(Category.first.clothing_items.size).not_to be(nil)
  end

  it 'has a name' do
    expect(Category.first.name).not_to be(nil)
  end

  it 'has a part of the body' do
    expect(Category.first.part_of_body).not_to be(nil)
  end
end
