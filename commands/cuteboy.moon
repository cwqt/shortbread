return (...) ->
  t = {}
  for k,v in pairs(select(1,...).channel.members)
    table.insert(t, v.name)
  qtboy = t[math.random(#t)]
  s = "**" .. qtboy .. "** is a qt! Yes they are! (✿◠‿◠)"
  if select(1,...).author.name == qtboy 
    s = s .. "\nHey, that's you! :hearts:"
  select(1,...).channel\send(s)