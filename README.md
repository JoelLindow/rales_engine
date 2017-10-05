# Rales Engine


This API allows for the accessing of information about Invoices, Items, Merchants, Customers and Transactions.

Welcome to the greatest emporium of garbage that has ever been emporium'd.  Behold our awesome selection of nothing but the finest trash. We can assure you, if you want garbage, you want our garbage. View all, view by categories, login, buy garbage. You name it, our site does it. You will never look at garbage, or Craigslist, the same way.

Site built with Ruby on Rails utilizing ActiveRecord on Postgresql. Site is primarily dominated by the item and categories pages, but includes basic capabilities to create users and login. Once logged in a user is able to edit their own page, but nobody else. By logging into the site as admin/admin, either locally or on Heroku, you can access the admin dashboard page. This page allows you to see the details of all the orders that have been created, as well as the ability to edit items and your user information.

### Prerequisites to Run Locally

  * [Rails version 5.1.4](http://installrails.com/)

  * [Ruby version 2.4.1](https://www.ruby-lang.org/en/documentation/installation/)

### Running Locally

  * Clone this repo.
  * cd into it
  * ```bundle install```
  * ```rake db:setup```
  * ```rake db:import_csv```
  * ```rails console```

## Authors


* **Danny Trujillo** - [Github](https://github.com/djtrujillo)
* **Joel Lindow** - [Github](https://github.com/JoelLindow)

## Acknowledgments

* Turing School of Software & Design

### Built With

 * Rails, Ruby, ActiveRecord, Postgresql

### Contributing

 * Want to contribute? Then you probably should have asked us earlier.
