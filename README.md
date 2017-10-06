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

### Routes to visit

  * **/api/v1/merchants/:id/items** returns a collection of items associated with that merchant
  * **/api/v1/merchants/:id/invoices** returns a collection of invoices associated with that merchant from their known orders
  * **/api/v1/invoices/:id/transactions** returns a collection of associated transactions
  * **api/v1/invoices/:id/invoice_items** returns a collection of associated invoice items
  * **/api/v1/invoices/:id/items** returns a collection of associated items
  * **/api/v1/invoices/:id/customer** returns the associated customer
  * **/api/v1/invoices/:id/merchant** returns the associated merchant
  * **/api/v1/invoice_items/:id/invoice** returns the associated invoice
  * **/api/v1/invoice_items/:id/item** returns the associated item
  * **/api/v1/items/:id/invoice_items** returns a collection of associated invoice items
  * **/api/v1/items/:id/merchant** returns the associated merchant
  * **/api/v1/transactions/:id/invoice** returns the associated invoice
  * **/api/v1/customers/:id/invoices** returns a collection of associated invoices
  * **/api/v1/customers/:id/transactions** returns a collection of associated transactions
  * **/api/v1/merchants/most_revenue?quantity=x** returns the top x merchants ranked by total revenue
  * **/api/v1/merchants/most_items?quantity=x** returns the top x merchants ranked by total number of items sold
  * **/api/v1/merchants/revenue?date=x** returns the total revenue for date x across all merchants
  * **/api/v1/merchants/:id/revenue** returns the total revenue for that merchant across successful transactions
  * **/api/v1/merchants/:id/revenue?date=x** returns the total revenue for that merchant for a specific invoice date x
  * **/api/v1/merchants/:id/favorite_customer** returns the customer who has conducted the most total number of successful transactions.
  * **/api/v1/items/most_revenue?quantity=x** returns the top x items ranked by total revenue generated
  * **/api/v1/items/most_items?quantity=x** returns the top x item instances ranked by total number sold
  * **/api/v1/customers/:id/favorite_merchant** returns a merchant where the customer has conducted the most successful transactions


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
