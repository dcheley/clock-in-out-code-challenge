# Clock In and Out Code Challenge

## Ruby version 2.4.0p0

## Additional gems:
  1) bootstrap-sass (Sass import of Bootstrap 2 and 3)
  2) jquery-rails (Quick setup for jQuery)
  3) pg (PostgreSQL database)
  4) bcrypt (To encrypt user passwords)

## Features:
  - User Authentication/Authorization with encrypted password
  - Ability to clock in and out once per day
  - Dynamic front-end with JSON requests
  - Attendance history view including Edit & Delete CRUD routes
  - Client side form input validations

## Setup - CLI:
  1) Clone repo
  2) run 'bundle install'
  3) run 'rails db:create'
  4) run 'rails db:migrate'
  5) run 'rails db:seed'
  4) run 'rails s'
  5) Open browser and enter 'localhost:3000' in the url bar to load the app!

## Summary:
  I tried to use as few gems as possible, along with a simple user experience and clean design.  

  The database seeds include one user along with a week's worth of attendance info (in /db/seeds.rb) to display the weekly attendance section (in users#show).

  All functional testing was done manually within the console. I also conducted end to end testing with all features.
