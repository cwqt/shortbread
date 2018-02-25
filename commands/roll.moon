return (...) ->
  select(1,...).channel\send("You rolled: **" .. math.random(10000, 99999) .. "**")