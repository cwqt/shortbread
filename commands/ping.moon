return (...) ->
  s = math.abs(os.clock()-(select(3,...)[1])*1000)
  s = tonumber(string.format("%.3f", s))
  select(1,...).channel\send("Pong! " .. s .. "ms")