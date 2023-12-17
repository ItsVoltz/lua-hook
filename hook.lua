---@class Hook
---@field fn function the original function
---@field hook function the hooked function
local Hook = {}
Hook.__index = Hook

function Hook:__call(...)
    return self.hook(self.fn, ...)
end

---Creates a new hook
---@param original fun(...): any the original function
---@param hook fun(original: fun(...): any, ...) the hooked function
---@return fun(...)
function Hook:New(original, hook)
    local self = setmetatable({}, self)

    self.fn = original
    self.hook = hook

    return function(...) -- We use a closure here instead of just directly returning the table with the __call metamethod because we don't want the hooekd function to show as a table, instead its still a function
        return self(...)
    end
end

return Hook
