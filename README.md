# Adaplo Test

Your task is to build a simple web app that will allow a user to view a campaign monitor mailing list, and to add and remove subscribers from it.

### Prerequisites

You need to have Ruby on Rails installed(http://installrails.com/)

## Installation

1. Pull the project down from GitHub using git clone
2. Change into the project directory using cd [project_name]
3. Install the gems using bundle install
4. Create the database rake db:create
5. Run the migrations rake db:migrate
6. Run rails server
7. Open http://localhost:3000/

OR 

1. Go to https://adaplo-glympe.herokuapp.com/

## Built With

* [Ruby On Rails](http://rubyonrails.org/) - The web framework used
* [Campaign Monitor](https://www.campaignmonitor.com/api/) - API Used
* [Bootstrap](http://getbootstrap.com/) - Used to make everything responsive



## Report

### What overall process you went through in completing the task

1. Checked - Studied the API. Registered for API key
2. Created a list to use in my application
3. Used POSTMAN to check which AUTH to use and to see the returned JSON format
4. Created a simple Rails app
5. Used recommended grabbers from API
6. Tested App
7. Done

### Key decisions you made

Initially i wanted to include a list of all subscribers as well, but after some more reading, the API authors mention that this API is not recommended for such operations (as some might have thousand of subscribers in a list). Thus i removed that part of the app.

### What slowed you down, what was unexpected

The auth part of the API.

### Problems you ran into, and how you solved them

The auth part as mentioned before and i solved it by following the Samples & Wrappers provided by the API in conjuction with POSTMAN.

### Tools and techniques you used

MVC, sass variables, bootstrap styling, responsive layout, clean UI.

## Author
* **Georgios Lymperopoulos** - Portfolio - (https://glympero-portfolio.heroku.com)