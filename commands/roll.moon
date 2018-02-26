return (...) ->
  select(1,...).channel\send(":game_die: You rolled: **" .. math.random(10000, 99999) .. "**")