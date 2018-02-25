-- https://discordapp.com/oauth2/authorize?&client_id=381831572573257728&scope=bot&permissions=0

require("moonscript")
SB = require("shortbread")
discordia = require('discordia')
secrets   = require("secrets")

client = discordia.Client()
client\on 'ready', ->
  print('Logged in as '.. client.user.username)

client\on 'messageCreate', (message) ->
  -- Check if start of message is our prefix
  if not message.content then return 
  if string.sub(message.content, 1, string.len(SB.prefix)) == SB.prefix
    -- Separate command from args
    c = SB.getCommand(message.content)
    a = SB.getCommandArgs(message.content)

    -- Create extra table for debugging
    e = {}
    e[#e+1] = os.clock()

    -- Run our command, if it exists
    if SB.commands[c]
      SB.commands[c](message, a, e)
    else
      SB.commands["invalid"](message)

client\run('Bot ' .. secrets.TOKEN)