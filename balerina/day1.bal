import ballerina/io;
import ballerina/lang.'int as ints;

function sum(int?[] vals) returns int? {
    int res = 0;
    foreach int? x in vals {
        if (x is ()) {
            return ();
        }
        res += x;
    }
    return res;
}

function part1(string[] lines) returns int {
    int incs = 0;
    int? last = (); 
    foreach string x in lines {
        int|error val = ints:fromString(x);
        if (val is int) {
            if (last is int) && (val > last) {
                incs += 1;
            }
            last = val;
        } 
    }

    return incs;
}

function part2(string[] lines) returns int {
    int incs = 0;
    int? last = ();
    int?[] delayline = [(), (), ()]; 
    foreach string x in lines {
        int|error val = ints:fromString(x);
        if (val is int) {
            delayline[0] = delayline[1];
            delayline[1] = delayline[2];
            delayline[2] = val;

            int? res = sum(delayline);
            if (res is int) {
                if (last is int) && (res > last) {
                    incs += 1;
                }
                last = res;
            }
        } 
    }

    return incs;
}

public function main() returns error? {
    string datFilePath = "../dat/day1.txt";

    string[] readLines = check io:fileReadLines(datFilePath);

    int ans1 = part1(readLines);
    io:println(ans1);

    int ans2 = part2(readLines);
    io:println(ans2);
}
