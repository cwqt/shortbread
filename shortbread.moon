SB = {}
SB.prefix = "!"

SB.commands = {
  ["echo"]:     (...) -> require("commands.echo")(...),
  ["github"]:   (...) -> require("commands.github")(...),
  ["invalid"]:  (...) -> select(1,...)\send("Invalid command!"),
}

SB.getCommand = (message) ->
  -- Return everything before a space, remove first instance of the prefix
  return string.match(message, "(%S+)")\gsub(SB.prefix, "", 1)

SB.getCommandArgs = (message) ->
  -- Strip first word+whitespace (the command)
  args = string.gsub(message, string.match(message, "(%S+)"), "")\match("^%s*(.-)%s*$")
  -- For each word separated by a space, place it into a numerically ordered table
  t = {}
  for arg in args\gmatch("%w+") do
    t[#t+1] = arg
  return t

return SB