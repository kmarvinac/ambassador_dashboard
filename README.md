# README

### Starting the server

The transparentcareer app needs to also be running in order for this app to run.

* Go to transparentcareer app on your local machine and run `foreman s`. This will start
  the transparentcareer app on `http://localhost:5000`
* You need the two apps running on different ports so this is very important. To start the ambassador app, run `foreman s -p 3000`. This will start the ambassador app on port 3000.
