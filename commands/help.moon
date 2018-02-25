SB = require("shortbread")

return (...) ->
  str = [[
    :bread: **shortbread** `v0.1`
    <https://github.com/twentytwoo/shortbread>
  ]]
  for command, _ in pairs(SB.commands) do
    str = str .. "`" .. command .. "`" .. ", "


  select(1,...).channel\send(str)