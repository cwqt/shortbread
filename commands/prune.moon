return (...) ->
  amount = select(2,...)[1]
  if amount != (nil or 0)
    select(1,...)\bulkDelete(select(1,...)\getMessages(amount))
    select(1,...)\send("Pruned " .. amount .. " messages.")
  else
    select(1,...)\send("Error! Invalid input :(")
