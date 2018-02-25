return (message, content) ->
  sentence = ""
  for k, arg in pairs(content) do
    sentence = sentence .. " " .. arg
  message.channel\send(sentence)

