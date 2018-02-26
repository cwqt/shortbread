return (...) ->
  t = {}
  for k,v in pairs(select(1,...).channel.members)
    print k
    table.insert(t, v.name)
  qtboy = t[math.random(#t)]

  p = select(2,...)[1] or select(1,...).author.name 
  s =  p .. " :hearts: " .. qtboy

  select(1,...).channel\send{
    embed: {
      title: s,
      color: 16724530
    }
  }
