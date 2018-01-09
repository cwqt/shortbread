-- https://discordapp.com/oauth2/authorize?&client_id=381831572573257728&scope=bot&permissions=0

require("moonscript")
SB        = require("shortbread")
discordia = require('discordia')
secrets   = require("secrets")

client = discordia.Client()
client\on 'ready', ->
  print('Logged in as '.. client.user.username)

client\on 'messageCreate', (message) ->
  -- Check if start of message is our prefix
  if string.sub(string.match(message.content, "(%S+)"), 1, string.len(SB.prefix)) == SB.prefix
    -- Separate command from args
    c = SB.getCommand(message.content)
    a = SB.getCommandArgs(message.content)

    -- Run our command, if it exists
    if SB.commands[c]
      SB.commands[c](message.channel, a)
    else
      SB.commands["invalid"](message.channel)

client\run('Bot ' .. secrets.TOKEN)