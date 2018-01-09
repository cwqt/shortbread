SB = {}
SB.prefix = "!"

SB.hashtable = {
  -- ["test"]:     (...) -> require(commands.test).run(...),
  ["github"]:   (...) -> select(1,...)\send("https://github.com/" .. select(2,...)[1]),
  -- ["lovewiki"]: (...) -> select(1,...)\send("http://love2d-community.github.io/love-api/#" .. select(2,...)),
  -- ["gelbooru"]: (...) -> select(1,...)\send("https://gelbooru.com/index.php?page=post&s=list&tags=" .. select(2,...)),
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