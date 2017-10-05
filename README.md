# Rales Engine

This API allows for the accessing of information about Invoices, Items, Merchants, Customers and Transactions.

Site built with Ruby on Rails utilizing ActiveRecord on Postgresql.
### Prerequisites to Run Locally

  * [Rails version 5.1.4](http://installrails.com/)

  * [Ruby version 2.4.1](https://www.ruby-lang.org/en/documentation/installation/)

### Running Locally

  * Clone this repo.
  * cd into it
  * ```bundle install```
  * ```rake db:create (if a database doesn't exist)```
  * ```rake db:migrate ```
  * ```rake import_csv:all (this will seed database)```
  * ```rails server```
  * ```Visit localhost:3000```

### Routes examples to visit

  * /api/v1/items
  * /api/v1/merchants
  * /api/v1/customers
  * /api/v1/transactions
  * /api/v1/customers/1/favorite_merchant
  * /api/v1/merchants/most_revenue?quantity=2
  * /api//merchant/2/revenue
  * etc.

### Schema Diagram / Database Layout
![API - Rales Engine Schema](https://i.imgur.com/rMmSP69.png)

## Authors

* **Danny Trujillo** - [Github](https://github.com/djtrujillo)
* **Joel Lindow** - [Github](https://github.com/JoelLindow)

## Acknowledgments

* Turing School of Software & Design
* apidock.com

### Built With

 * Rails, Ruby, ActiveRecord, Postgresql

#### Thank you for taking the time to view our application
