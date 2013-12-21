#!/bin/bash 
git push heroku
heroku run rake db:migrate