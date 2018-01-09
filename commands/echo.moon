return (server, content) ->
  sentence = ""
  for k, arg in pairs(content) do
    sentence = sentence .. " " .. arg
  server\send(sentence)

