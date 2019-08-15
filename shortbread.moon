SB = {}
SB.prefix = "\\"
SB.START_TIME = os.clock()

SB.commands = {
  ["echo"]:     (...) -> require("commands.echo")(...),
  ["github"]:   (...) -> require("commands.github")(...),
  ["ping"]:     (...) -> require("commands.ping")(...),
  ["prune"]:    (...) -> require("commands.prune")(...),
  ["cuteboy"]:  (...) -> require("commands.cuteboy")(...),
  ["roll"]:     (...) -> require("commands.roll")(...),
  ["help"]:     (...) -> require("commands.help")(...),
  ["cblaw"]:    (...) -> require("commands.cblaw")(...),
  ["truelove"]: (...) -> require("commands.truelove")(...),
  ["casspost"]: (...) -> require("commands.markov")(...),
  ["invalid"]:  (...) -> select(1, ...).channel\send("Invalid command!"),
}

SB.getCommand = (message) ->
  -- Return everything before a space, remove first instance of the prefix
  return string.match(message, "(%S+)")\gsub(SB.prefix, "", 1)

SB.getCommandArgs = (message) ->
  -- Strip first word+whitespace (the command)
  args = string.gsub(message, string.match(message, "(%S+)"), "")\match("^%s*(.-)%s*$")
  -- For each word separated by a space, place it into a numerically ordered table
    -- !command arg1 arg2 argn
    -- 1: arg1
    -- 2: arg2
    -- n: argn
  t = {}
  for arg in args\gmatch("%w+") do
    t[#t+1] = arg
  return t

return SB