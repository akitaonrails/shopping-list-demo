require "spec_helper"

describe ShoppingList do
  let(:shopping_list) { FactoryGirl.build(:shopping_list) }
  context "Creating" do
    it "#save" do
      expect{ shopping_list.save }.to change{ ShoppingList.count }.by(1)
    end
  end
end
