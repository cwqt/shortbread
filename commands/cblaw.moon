SB = require("shortbread")
-- !cblaw distance (km)
-- returns goodness, follows inverse sq law.
return (...) ->
  d = select(2, ...)[1] or nil
  s = ""
  if d == "help"
    s = "**cuteboys law**: The goodness/compatibility of a bf follows the inverse square law.\n"
    s = s .. "The better a boyfriend is, the farther away from you he is (growing exponentially)\n"
    s = s .. "`!cblaw distance`, where distance is in [km]."
    s = s .. "\n\nLower _cblaw_ number == better bf"
  else
    if tonumber(d)
      d = tonumber(d)
      if d < 40075 -- c of earth
        cb = 40075/d^2
        cb = math.floor(cb*10000)/10000
        s = "**" .. tostring(cb) .. "**"
      else
        s = "no ayylien bf's allowed."
    else
      s = "Invalid input (number expected)"
  select(1,...).channel\send(s)