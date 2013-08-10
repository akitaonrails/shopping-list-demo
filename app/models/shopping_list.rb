class ShoppingList < ActiveRecord::Base
  attr_accessible :description, :name, :total, :shopping_items_attributes
  has_many :shopping_items
  accepts_nested_attributes_for :shopping_items, :reject_if => :all_blank, :allow_destroy => true

  before_save :update_total

  private

    def update_total
      @calculator = ShoppingCalculator.new(self)
      self.total = @calculator.total
    end
end
