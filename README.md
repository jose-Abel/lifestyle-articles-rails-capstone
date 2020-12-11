![](https://img.shields.io/badge/Microverse-blueviolet)

# Life Style Articles Rails Capstone

The Microverse Rails Capstone that consist of building a web app based on lifestyle articles website. Following the design of the website https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version, and personalising the content.

## Built With
- Ruby programming language
- Rails framework
- HTML
- CSS
- Bootstrap
- Deployment with Heroku

### Ruby gems:
- MiniTests
- rubocop

### Yarn packages:
- bootstrap 
- jquery 
- popper.js

## Author
- 👤GitHub: [Jose Abel Ramirez](https://github.com/jose-Abel)
- Linkedin: [Jose Abel Ramirez Frontany](https://www.linkedin.com/in/jose-abel-ramirez-frontany-7674a842/)


## Getting Started
Can download this code with any method and over the terminal with the commands:

- git clone https://github.com/jose-Abel/lifestyle-articles-rails-capstone.git
- cd lifestyle-articles-rails-capstone
- bundle install
- yarn install
- yarn add bootstrap jquery popper.js


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
