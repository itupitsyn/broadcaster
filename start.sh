#!/bin/bash

# Start the first process
node ./server/app.js &

# Start the second process
npm start --prefix client &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
