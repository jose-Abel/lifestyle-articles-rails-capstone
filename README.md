![](https://img.shields.io/badge/Microverse-blueviolet)

# Life Style Articles Rails Capstone

The Microverse Rails Capstone that consist of building a web app based on lifestyle articles website. Following the design of the website https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version, and personalising the content.

Following an MVP approach per Rails structure, the project consist of the models, views and controllers of each resource and the routes file routing the propers HTML request to it's corresponding route.

The project has 4 resources as instructed in the requirements. This are User, Article, Vote, Category. A User has many articles and many votes. An Article belongs to an User and has many votes. A Vote belongs to an Article and to an User. And the Article and Category have a many to many relationship through the article categories table.

The main view is the Article Index view since its the root page. This view is in charge of rendering the article with the most votes in the hero section and the rest of the articles below. In order to implement this, a scope was created in the Vote model to query for the article with the most votes and helper methods were created in the article helpers file to remove the logic from the views to a helper file.

The articles in the root page have a link to the category they belong to, once click it redirect to the category show view where all the articles from the same category are display.

Also, the articles in the root page has a link in the title of the article that redirects to the article show page where the complete body of the article is display and if the current user login is the author of the article will display buttons to edit the article and to delete it.

The web app has a login and sign up system that only requires a username as requested in the instructions of the project.

For the CSS it was used Boostrap and also some CSS code directly in the custom.css.scss file.

To upload image was implemented with the gems carrierwave, minimagick and fog-aws. 

The test were made with Rails minitest library.

## Built With
- Ruby programming language
- Rails framework
- HTML
- CSS
- Bootstrap
- Deployment with Heroku

### Ruby gems:
- carrierwave
- fog-aws
- mini_magick

### Yarn packages:
- bootstrap 
- jquery 
- popper.js


### Deployment

[live demo](https://lifestyle-articles-jose-abel.herokuapp.com/)


## Author
- 👤GitHub: [Jose Abel Ramirez](https://github.com/jose-Abel)
- Linkedin: [Jose Abel Ramirez Frontany](https://www.linkedin.com/in/jose-abel-ramirez-frontany-7674a842/)


## Getting Started
Can download this code with any method and over the terminal with the commands:

- git clone https://github.com/jose-Abel/lifestyle-articles-rails-capstone.git
- cd lifestyle-articles-rails-capstone

Instal gems with:

```
bundle install
```

Run

```
yarn install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.


## Run linters
For the linters, this tests runs once you make a PR, if you have it in the respective folder. In order to have this tests, after cloning this project:
- cd lifestyle-articles-rails-capstone
- From the root of this project create the folders .github/workflows
- Add a copy of [.github/workflows/tests.yml](https://github.com/microverseinc/linters-config/blob/master/ruby/.github/workflows/tests.yml) to the .github/workflows

## Run Rails mini test
To run all of the tests, open the terminal from the root of the program and type the command:

- rails db:migrate RAILS_ENV=test
- rails test

## Run Rubocop tests
The instructions to setup this tests are at this repository: [Rubocop instructions](https://github.com/microverseinc/linters-config/tree/master/ruby)

To download rubocop and run the tests on your local environment, this are the commands to type in the Linux, Mac terminal or Windows cmd:
- gem 'rubocop'
- cd lifestyle-articles-rails-capstone
- copy this file [.rubocop.yml](https://github.com/microverseinc/linters-config/blob/master/ruby/.rubocop.yml) in the root directory of the project
- type in the terminal 'rubocop'


### Acknowledgments
Appreciate the Ruby Team, and a special acknowledgment to Microverse for pushing us further to increase our knowledge.

Design idea by [Nelson Sakwa on Behance](https://www.behance.net/sakwadesignstudio)

## 📝 License
This project is MIT licensed.
