return (...) ->
  username = select(2, ...)[1]
  if username == nil
	  select(1,...).channel\send("No username provided")
	  return
	  
  s = "https://github.com/" .. username
  select(1,...).channel\send(s)