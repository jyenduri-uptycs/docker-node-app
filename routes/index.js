const express = require('express')
const app = express()
const fs = require('fs');

let config = fs.readFileSync('./config/app_config.json', 'utf-8')
config = JSON.parse(config);
app.use((request, response, next) => {
  console.log(request.headers)
  next()
})

app.use((request, response, next) => {
  request.chance = Math.random()
  next()
})

app.get('/', (request, response) => {
  response.json({
    chance: request.chance
  })
})

app.listen(config.APP_PORT)