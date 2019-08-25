# shortbread
Just a little experiment.

## Installation

```bash
luarocks install moonscript
luarocks install rxi-json-lua
brew install luvit
lit install SinisterRectus/discordia
sh build.sh
```
I probably missed some things but you should just use your brain and figure it out.

---

All commands are contained within `commands/` and follow the following structure:

```moonscript
-- myCommand.moon
return (server, content) ->
  -- !command arg1 arg2 arg3
  -- content = {arg1, arg2, arg3}

  message = content[n]
  server\send(message)
```

and then in `shortbread.moon`

```moonscript
SB.commands = {
  ["myCommand"]: (...) -> require("commands.myCommand")(...),
  -- ...
```
---

Bot requires a token from developers.discord.com 

```moonscript
-- secrets.lua
secrets = { TOKEN: "your_token_here" }
return secrets
```