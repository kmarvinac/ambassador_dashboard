#!/bin/bash

if [ $1 = 'quick' ]; then
  foreman start -p 3000
else
  bundle install
  foreman run rake db:migrate
  foreman start -p 3000
fi
