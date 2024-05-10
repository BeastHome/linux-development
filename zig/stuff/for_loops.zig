const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    for (1..1001) |counter_value| {
        for (1..1001) |counter_value2| {
            print("Value1 = {} and Value2 = {}\r", .{ counter_value, counter_value2 });
        }
    }
    print("\n", .{});
}
