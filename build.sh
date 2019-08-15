mkdir src/
moonc -t src .
cp data.json src/data.json
cd src
luvit bot.lua
