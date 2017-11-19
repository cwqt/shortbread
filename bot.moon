-- https://discordapp.com/oauth2/authorize?&client_id=381831572573257728&scope=bot&permissions=0

require("moonscript")
SB        = require("shortbread")
discordia = require('discordia')
secrets   = require("secrets")


client = discordia.Client()

client\on 'ready', ->
  print('Logged in as '.. client.user.username)

client\on 'messageCreate', (message) ->
  -- Check if the first string begins with the SB.prefix, prevents infinite looping
  if string.sub(string.match(message.content, "(%S+)"), 1, string.len(SB.prefix)) == SB.prefix
    SB.hashtable[SB.getCommand(message.content)](message.channel, SB.getValue(message.content))

client\run('Bot ' .. secrets.TOKEN)