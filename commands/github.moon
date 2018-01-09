return (...) ->
  username = select(2, ...)[1]
  s = "https://github.com/" .. username
  select(1,...)\send(s)