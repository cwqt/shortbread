return (...) ->
  amount = select(2,...)[1]
  select(1,...)\bulkDelete(select(1,...)\getMessages(amount))
  select(1,...)\send("Pruned " .. amount .. " messages.")
