SB = require("shortbread")

return (...) ->
  amount = select(2,...)[1]
  if (amount != nil) and (string.match(amount, "^[0-9]*$") != nil) and (tonumber(amount) > 0)
    select(1,...).channel\bulkDelete(select(1,...).channel\getMessages(amount))
    select(1,...).channel\send("Pruned " .. amount .. " messages.")
  else
    SB.commands["invalid"](...)
