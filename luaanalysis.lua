package.path = package.path .. ";./deps/?.lua"
local argparse = require "argparse"

local parser = argparse("luaanalysis", "run tests on a lua file")

parser:argument("LUA_FILE", "the file to run. This is required.")

parser:flag("-v --verbose", "gives descriptions of the basic internals before executing the processes.")


local args = parser:parse()


if args.verbose then
    print("v: load file to lua stack (LUA-1)")
end

local a = loadfile(args.LUA_FILE)

if args.verbose then
    print("v: check if the file is NIL or the file is successfully loaded into the stack (LUA-2)")
end

if a == nil then
    print("err: please check the file that you are trying to load. I couldn't get the file details.")
    print("causes: Lua Error, Memory error, Permission Denied, Is a directory.")
    os.exit(-1)
end
print("1: test 1 passed!")

if args.verbose then
    print("v: run file on stack")
end

print("done! running file...")

local status = pcall(function () a() end)

if not status then
    print("error in lua file code. Exiting...")
    os.exit(-1)
else
    print("OK")
end