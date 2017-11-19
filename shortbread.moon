SB = {}
SB.prefix = "!"

SB.hashtable = {
  ["!github"]:  (...) -> select(1,...)\send("https://github.com/" .. select(2,...)),
  ["!invalid"]: (...) -> select(1,...)\send("Invalid command!")
}

SB.getCommand = (message) ->
  -- Return everything before a space
  return string.match(message, "(%S+)")

SB.getValue = (message) ->
  -- Return everything after the command, trim whitespace
  return string.gsub(message, string.match(message, "(%S+)"), "")\match("^%s*(.-)%s*$")

return SB