lines = [[199
200
208
210
200
207
240
269
260
263]]
INCREASE = "(increased)"
DECREASE = "(decreased)"
total_increases = 0
last = nil
for token in string.gmatch(lines, "[^%s]+") do
    if (last == nil) then
        last = token
        print(token .. " (N/A - no previous measurement)")
    else
        total_increases = total_increases + ((token > last) and 1 or 0)
        print(token .. " " .. ((token > last) and INCREASE or DECREASE))
        last = token
    end
end

print(total_increases .. " measurements are larger than the previous measurement")
