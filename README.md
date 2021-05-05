# README

1. Sign up giving name, email and password (no confirmation required for now).
2. Click the `Check In` button to start the timer and then `Check Out` button to stop it.
3. A table will be displayed below to show all the times tracked sorted by date.
4. Can edit each single record in the table.

## Installation

* Install the dependencies with `bundle install`
* Create the database with `rake db:create`
* Initialize the database `rake db:schema:load`
* Simply start the server `rails s -p 3000` and start to play around

## RSpec testing

* Run `rspec` in the terminal to run all spec files
* All spec files are located in the `/spec` directory

## Approaches taken to complete the challenge...

* Read the requirements carefully and stuck to the requirements
* Didnt' try to make things too complicated by trying to oversell myself through my coding
* Had one or two more features in plan to add but needed to change on the way as didn't have enough time

## Schema design...

```text
Well the requirements were pretty simple and didn't require too many time in the database design.
Have a table "users" and another table "clock_events". A user will have many clock events. Please see
the db/schema.rb file to get more idea about the database design.
```

## Future Enhancements...

* Add a visible timer. So when the user clicks the check in button the timer starts.
* As users will be taking breaks in between so instead of checking out and creating multiple clock event
records for a single day, will enhance to have a `Pause` and `Resume` button. So the check out button will
be only clicked when finishing up for the day. In this way there will be only one record in the database for
a single day, which makes it more simple and easy to access.
* Admin users can sign in and can pull out time sheets of their employees. Export those reports as excel file.
* And of course make the pages look more user friendly and attractive.

