SB = require("shortbread")

return (...) ->
  str = ""
  for command, _ in pairs(SB.commands) do
    str = str .. "`" .. command .. "`" .. ", "

  select(1,...).channel\send{ file: "sb.png"}
  select(1,...).channel\send{
    embed: {
      title: ":bread: **shortbread** `v0.1`", 
      color: 7506394,
      fields: {
        { name:"Commands", value: str }
        }
      },
    }