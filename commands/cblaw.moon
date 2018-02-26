SB = require("shortbread")
-- !cblaw distance (km)
-- returns goodness, follows inverse sq law.
return (...) ->
  d = select(2, ...)[1] or nil
  s = ""
  if d == "help"
    select(1,...).channel\send{
      embed: {
        title: "Cuteboys law",
        color: 16761035,
        fields: {
          {
            name: "The goodness/compatibility of a bf follows the inverse square law."
            value: [[
The better a boyfriend is, the farther away from you he is (growing exponentially)
```!cblaw distance``` 
Where distance is in **KM**. A lower number generally means a better bf, uwu
                    ]]
          }
        }
      }
    }
  else
    if tonumber(d)
      d = tonumber(d)
      if d < 40075 -- c of earth
        cb = 40075/((d/2)^2)
        cb = math.floor(cb*10000)/10000
        s = "**" .. cb .. "**"
        print(cb)
        if cb < 0.01 
          s = s .. ", just give up ;__;"
      else
        s = "no ayylien bf's allowed."
    else
      s = "Invalid input (number expected)"
    select(1,...).channel\send(s)