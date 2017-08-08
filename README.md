# README

Recipe -

-recipe should be valid
-name should be present
-description should be present
-chef_id should be present
-maximum length for name descriptoion, maybe a min.

Chef - 
-chefname should be present
-email should be present
-size restricitons on email and chefname
-email address should be valid format.
-email should be unigue.

Ingredients
-will have name attribute
-will have many-to-many association with recipes

Comments
-will have description attribute
-will have 2 one-to-many associations with recipes and chefs
-therefore - will have chef_id and recipe_id foreign keys
