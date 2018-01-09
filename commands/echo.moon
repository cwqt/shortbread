return (...) ->
  sentence = ""
  for k, arg in pairs(select(2,...)) do
    sentence = sentence .. " " .. arg
  select(1,...)\send(sentence)

