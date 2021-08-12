all:
	luac -o luaanalysis ./luaanalysis.lua

dep-all:
	mkdir deps
	wget https://raw.githubusercontent.com/mpeterv/argparse/master/src/argparse.lua -O ./deps/argparse.lua
