const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var counter_value: u32 = 0;
    while (counter_value <= 10000) : (counter_value += 1) {
        var counter_value2: u32 = 0;
        while (counter_value2 <= 10000) : (counter_value2 += 1) {
            print("Value1 = {} and Value2 = {}\r", .{ counter_value, counter_value2 });
        }
    }
    print("\n", .{});
}
