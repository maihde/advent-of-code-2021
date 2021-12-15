import strutils
import std/sequtils
import os

proc readCrabs() : seq[int] = 
    # 'result' is implicitly defined as an empty sequence

    # Open the file
    let f = open("../dat/day7.txt")
    # Close the file at the end of this procedure call
    defer: f.close()

    # Read the first line
    let firstLine = f.readLine()
    # Read the crabs
    for crab in firstLine.split(","):
        result.add(parseInt(crab))

proc calculateAlignedPosition(mode : string) : (int, int) =
    let
        crabs = readCrabs() # read all the crabs into a sequence
        maxI = maxIndex(crabs) # find the index of the crab with the maximal position
        maxV = crabs[maxI] # find the maximal position of the crab

    var
        least_fuel = (fuel: -1, pos: 0)

    for pp in 0 .. maxV:
        var fuel_used = 0
        for cc in crabs:
            if mode == "part1":
                fuel_used += abs(cc - pp)
            elif mode == "part2":
                let nn : int = abs(cc - pp) + 1
                fuel_used += int( (nn*(nn - 1)) / 2)

        if least_fuel.fuel == -1 or least_fuel.fuel > fuel_used:
            least_fuel[0] = fuel_used
            least_fuel[1] = pp

    result = least_fuel

when isMainModule:
    if paramCount() == 0:
        echo("You must provide an argument of 'part1' or 'part2'") 
        quit(QuitFailure)
    let answer = calculateAlignedPosition(paramStr(1))
    echo(answer)