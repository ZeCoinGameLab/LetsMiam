# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Generic ...'

#######################
#      RESTAURANT
#######################

Restaurant.create(name: 'Restaurant Pizza', description: 'A perfect place for eating classic pizza')
Restaurant.create(name: 'Restaurant Pizza 2', description: 'A perfect place for eating classic pizza')
Restaurant.create(name: 'Restaurant Sushi', description: 'A perfect place for eating classic sushi')
Restaurant.create(name: 'Restaurant Sushi 2', description: 'A perfect place for eating classic sushi')
Restaurant.create(name: 'Rest Hamburgers', description: 'A perfect place for eating classic hamburgers')
Restaurant.create(name: 'Rest Hamburgers 2', description: 'A perfect place for eating classic hamburgers')
Restaurant.create(name: 'Restaurant Tacos', description: 'A perfect place for eating classic tacos')
Restaurant.create(name: 'Restaurant Tacos 2', description: 'A perfect place for eating classic tacos')

#######################
#      MENU
#######################

Menu.create(name: 'Menu du jour', price: 15.00, restaurant_id: 1)
Menu.create(name: 'Menu du jour', price: 15.00, restaurant_id: 2)
Menu.create(name: 'Menu du jour', price: 20.00, restaurant_id: 3)
Menu.create(name: 'Menu du jour', price: 20.00, restaurant_id: 4)
Menu.create(name: 'Menu du jour', price: 14.00, restaurant_id: 5)
Menu.create(name: 'Menu du jour', price: 14.00, restaurant_id: 6)
Menu.create(name: 'Menu du jour', price: 16.00, restaurant_id: 7)
Menu.create(name: 'Menu du jour', price: 16.00, restaurant_id: 9)

#######################
#      DISH CAT
#######################

#IDs 1..3
DishCategory.create(name: 'Entrees', restaurant_id: 1)
DishCategory.create(name: 'Pizzas', restaurant_id: 1)
DishCategory.create(name: 'Desserts', restaurant_id: 1)

#IDs 4..6
DishCategory.create(name: 'Entrees', restaurant_id: 2)
DishCategory.create(name: 'Pizzas', restaurant_id: 2)
DishCategory.create(name: 'Desserts', restaurant_id: 2)

#IDs 7..9
DishCategory.create(name: 'Entrees', restaurant_id: 3)
DishCategory.create(name: 'Menus', restaurant_id: 3)
DishCategory.create(name: 'Desserts', restaurant_id: 3)

#IDs 10..12
DishCategory.create(name: 'Entrees', restaurant_id: 4)
DishCategory.create(name: 'Menus', restaurant_id: 4)
DishCategory.create(name: 'Desserts', restaurant_id: 4)

#IDs 13..15
DishCategory.create(name: 'Entrees', restaurant_id: 5)
DishCategory.create(name: 'Hamburgers', restaurant_id: 5)
DishCategory.create(name: 'Desserts', restaurant_id: 5)

#IDs 16..18
DishCategory.create(name: 'Entrees', restaurant_id: 6)
DishCategory.create(name: 'Hamburgers', restaurant_id: 6)
DishCategory.create(name: 'Desserts', restaurant_id: 6)

#IDs 19..21
DishCategory.create(name: 'Entrees', restaurant_id: 7)
DishCategory.create(name: 'Tacos', restaurant_id: 7)
DishCategory.create(name: 'Desserts', restaurant_id: 7)

#IDs 22..24
DishCategory.create(name: 'Entrees', restaurant_id: 8)
DishCategory.create(name: 'Tacos', restaurant_id: 8)
DishCategory.create(name: 'Desserts', restaurant_id: 8)

#######################
#      Dish
#######################

#Plat Restau ID : 0
Dish.create(name: 'Margherita', details: 'Tomates, Mozzarella, Olives', price: 11.00, dish_category_id: 2)
Dish.create(name: 'Reine', details: 'Tomates, Mozzarella, Jambon, Olives', price: 12.00, dish_category_id: 2)
Dish.create(name: 'Royale', details: 'Tomates, Mozzarella, Jambon, Champignons, Olives', price: 14.00, dish_category_id: 2, menu_id: 1)
Dish.create(name: 'Savoyarde', details: 'Creme, Patates, Reblochon, Oignons, Oeuf', price: 16.00, dish_category_id: 2)

Dish.create(name: 'Sorbet', details: 'Parfum au choix : framboise, citron, ananas, noix de coco, abricot', price: 5.00, dish_category_id: 3, menu_id: 1)
Dish.create(name: 'Brownie', details: 'Gateau au chocolat', price: 5.00, dish_category_id: 3)

#Plat Restau ID : 1
Dish.create(name: 'Margherita', details: 'Tomates, Mozzarella, Olives', price: 12.00, dish_category_id: 5)
Dish.create(name: 'Reine', details: 'Tomates, Mozzarella, Jambon, Olives', price: 13.00, dish_category_id: 5)
Dish.create(name: 'Royale', details: 'Tomates, Mozzarella, Jambon, Champignons, Olives', price: 14.00, dish_category_id: 5)
Dish.create(name: 'Savoyarde', details: 'Creme, Patates, Reblochon, Oignons, Oeuf', price: 15.00, dish_category_id: 5, menu_id: 2)

Dish.create(name: 'Sorbet', details: 'Parfum au choix : framboise, citron, ananas, noix de coco, abricot', price: 4.00, dish_category_id: 6, menu_id: 2)
Dish.create(name: 'Brownie', details: 'Gateau au chocolat', price: 4.00, dish_category_id: 6)

#######################
#      TAG
#######################

FoodTag.create(name: 'Italien')
FoodTag.create(name: 'Pizza')

#######################
# TAG RESTAU ASSEMBLY
#######################

AssociationFoodTagRestaurant.create(food_tag_id: 1, restaurant_id: 1)
AssociationFoodTagRestaurant.create(food_tag_id: 1, restaurant_id: 2)
AssociationFoodTagRestaurant.create(food_tag_id: 2, restaurant_id: 1)
AssociationFoodTagRestaurant.create(food_tag_id: 2, restaurant_id: 2)

#######################
#        USER
#######################

User.create(name: 'Kevin', firstname: 'Mays')
User.create(name: 'Jonh', firstname: 'Do')



puts 'Seeding Done.'