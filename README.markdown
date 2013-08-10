# Simulating an ActiveRecord association problem

## Install

  ```
  git clone https://github.com/akitaonrails/shopping-list-demo.git
  cd shopping-list-demo
  git checkout -b bug b156b84dfaf2968a218955e09c8d15a9048e8f59
  bundle install
  rake db:migrate
  rails s # or rake spec
  ```

## The Associations

  There is a ShoppingList that has many ShoppingItems

  A ShoppingItem has a simple #sub_total method that returns its quantity x price

  The ShoppingList as a tax_rate column

  The total amount worth of the ShoppingList should be:

  ```
  list.items.inject(0) { |total, item| total += (item.sub_total) + (list.tax_rate * item.sub_total) }
  ```

## The Problem

  This kind of situation happens in an evolutionary way. This is a very simplified example of a very obvious bad practice, but it can go unnoticed in larger apps with more code in between.

  If you run the application and create a new List you will notice that the total will be wrong unless you try to save the resource twice.

  ![Wrong Total](https://www.evernote.com/shard/s1/sh/a1d73a2f-4268-4e3a-9edc-426e4366b912/aaf74eda22d1c4a70aa59a28169950ea/deep/0/ShoppingListDemo.png)

  The problem is that when the total for each item is being calculated, it's fetching the wrong outdated tax_rate from its parent list resource.

  This happens because the calculation is being triggered in a #before_save in the list model and also because the item model is fetching the parent through it's #belong_to association.

  Those 2 aspects make the first list object to have the updated tax_rate but within the item model it's fetching the list model again and using the outdated tax_rate

  When the list and the items are saved, the new tax_rate is recorded but the total is wrong because it used the previous value

  The important thing is that associations such as #belongs_to is a dynamically generated model. It won't point to an already fetched object.

