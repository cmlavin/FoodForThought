# Food For Thought

[Food For Thought Demo](http://foodforthought-flatiron.herokuapp.com/)

Food For Thought is a full stack web application inspired by chef's cookbooks where they share recipes and tell the stories behind them. The entire application is written in Ruby on Rails using a PostgreSQL database to persist user information, recipes, ingredients, and stories. The responsive front-end is built using Materialize and ERB templates.

## Features

* Account creation and user authentication
  * Passwords are encrypted using the bcrypt gem
* Search for recipes by name or ingredient
* Save your favorite recipes or stories
* Create, read, update, or delete recipes and stories
  * Only the author can modify their own entries
* Upload images to AWS
* User profile
  * Users can view recipes and stories they wrote and those they have saved

![Food For Thought Homepage](/app/assets/images/FoodApp.png "Food For Thought Homepage")
