# This will guess the User class
FactoryGirl.define do
  factory :shopping_list do
    name "List"
    description  "List"
    tax_rate 0.0
  end

  # This will use the User class (Admin would have been guessed)
  factory :shopping_item do
    name "Soap"
    quantity 1
    price 2.5
  end
end
