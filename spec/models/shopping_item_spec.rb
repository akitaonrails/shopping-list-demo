require "spec_helper"

describe ShoppingItem do
  let(:shopping_item) { FactoryGirl.build(:shopping_item) }
  let(:shopping_list) { double "shopping_list" }
  before do
    shopping_list.stub(:tax_rate) { 0.0 }
    shopping_item.stub(:shopping_list) { shopping_list }
  end
  context "Creating" do
    it "#save" do
      expect{ shopping_item.save }.to change{ ShoppingItem.count }.by(1)
    end
  end
  context "Calculation" do
    it "#total" do
      shopping_item.quantity = 10
      shopping_item.price = 2.5
      expect(shopping_item.total).to eq(10 * 2.5)
    end
  end
end

