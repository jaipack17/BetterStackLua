local BetterStack = {}
BetterStack.__index = BetterStack

type BetterStack = { any }

function BetterStack.new(): BetterStack
	return setmetatable({}, BetterStack)
end

function BetterStack:push(element: any)
	self[#self+1] = element
end

function BetterStack:pushMany(...): BetterStack
	local args = #{...}
	local arr = {...}
	for i = 1, args do
		self[#self+1] = arr[i]
	end
	return self
end

function BetterStack:pop(): any
	assert(#self > 0, "Attempt to pop value from empty stack!")
	local output = self[#self]
	self[#self] = nil
	return output
end

function BetterStack:top(): any
	assert(#self > 0, "Attempt to use top() on an empty stack!")
	return self[#self]
end

function BetterStack:bottom(): any
	assert(#self > 0, "Attempt to use bottom() on an empty stack!")
	return self[1]
end

function BetterStack:clone(): BetterStack
	return table.move(self, 1, #self, 1, table.create(#self))
end

function BetterStack:bomb(): BetterStack
	table.clear(self)
	return self
end

function BetterStack:size()
	return #self
end
function BetterStack:cut(i)
	if i == 0 or i >= #self then
		error("Wrong argument passed to cut()")
	else
		for a = #self - i + 1, #self do
			self[a] = nil
		end
		return self
	end
end
function BetterStack:pile(...)
	local args = {...}
	for i = 1, #args do
		for j = 1, #args[i] do
			local a = args[i]
			self[#self+1] = a[j]
		end
	end
	return self
end
function BetterStack:print()
	print(self)
end
function BetterStack:find(val)
	local ans = false
	for i = 1, #self do
		if self[i] == val then
			ans = true
			return ans
		end
	end
	return ans
end
function BetterStack:min()
	for i = 1, #self do
		if typeof(self[i]) == "string" or typeof(self[i]) == "boolean" then
			error("Attempt to use min() on string or boolean value")
		end 
	end
	local ans = 2147483647
	for i = 1, #self do
		if self[i] < ans then
			ans = self[i]
		end
	end
	return ans
end
function BetterStack:max()
	for i = 1, #self do
		if typeof(self[i]) == "string" or typeof(self[i]) == "boolean" then
			error("Attempt to use max() on string or boolean value")
		end 
	end
	local ans = -2147483648
	for i = 1, #self do
		if self[i] > ans then
			ans = self[i]
		end
	end
	return ans
end
function BetterStack:average()
	for i = 1, #self do
		if typeof(self[i]) == "string" or typeof(self[i]) == "boolean" then
			error("Attempt to use average() on string or boolean value")
		end 
	end
	local sum = 0
	for i = 1, #self do
		sum = sum + self[i]
	end
	return sum/#self
end
function BetterStack:sortStack()
	
end
function BetterStack:mid()
	local a = self[#self/2]
	return a
end
function BetterStack:isEmpty()
	if #self == 0 then
		return true
	else
		return false
	end
end
function BetterStack:desc(str)
	return str
end
function BetterStack:based()
	local str = 0
	local number = 0
	local bool = 0
	for i = 1, #self do
		if typeof(self[i]) == "number" then
			number = number + 1
		end 
		if typeof(self[i]) == "string" then
			str = str + 1
		end 
		if typeof(self[i]) == "boolean" then
			bool = bool + 1
		end 
	end
	if str > number and str > bool then
		return "String Based"
	end
	if number > str and number > bool then
		return "Number Based"
	end
	if bool > str and bool > number then
		return "Boolean Based"
	end
	if bool == str or bool == number or number == str then
		return "Multi Based"
	end
end
function BetterStack:freq(val)
	local count = 0
	for i = 1, #self do
		if self[i] == val then
			count = count + 1
		end
	end
	return count
end
function BetterStack:hasNumber()
	for i = 1, #self do
		if typeof(self[i]) == "number" then
			return true
		end
	end
	return false
end
function BetterStack:hasString()
	for i = 1, #self do
		if typeof(self[i]) == "string" then
			return true
		end
	end
	return false
end
function BetterStack:hasBool()
	for i = 1, #self do
		if typeof(self[i]) == "boolean" then
			return true
		end
	end
	return false
end
function BetterStack:toString()
	for i = 1, #self do
		self[i] = tostring(self[i])
	end
	return self
end

return BetterStack
