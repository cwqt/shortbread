-- https://discordapp.com/oauth2/authorize?&client_id=381831572573257728&scope=bot&permissions=0

require("moonscript")
discordia = require('discordia')
secrets   = require("secrets")
client = discordia.Client()

client\on 'ready', ->
  print('Logged in as '.. client.user.username)

client\on 'messageCreate', (message) ->
  if message.content == '!ping'
    message.channel\send('Pong!')

client\run('Bot ' .. secrets.TOKEN)
