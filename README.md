# code-folio

# Overview

This is my submission for the Rails Portfolio Project. The application is called "Code Folio", where a user can sign up and create a coding portfolio for the coding world to see. The user will have the ability to create posts on their page. The post created by the user will be displayed on their page and on the news feed page depending on if the user is following them or not. Yes, there is a follow feature in this app. Once you follow someone, you will be able to see their posts from your index page starting with the most recent. This was my attempt to create a social media app for Software Engineers.

# Getting Started

To get started, you can fork and clone this repo. After you have forked and cloned this repo, you can head over to your ide and run the following command: git clone (repo you cloned goes here without the parentheses) and then press enter. On the following line you can run the command: cd (name of repo). Once thats done, you can open the project by opening up your favorite text editor. I use Visual Studio Code, so in my case it would be: code . to open the whole project.

Once this is done, you can run bundle install and rake db:migrate. After that, all you need to do is run rails s or rails server and then go to your web browser and type in localhost:3000.

# Built With

- Ruby
- Rails
- ActiveRecord
- Sqlite3

# Notable Features

- Registration
- Login
- Follow feature
- Search Bar to find a user
- Uploading an image for your Profile Picture
- Bcrypt for password authentication