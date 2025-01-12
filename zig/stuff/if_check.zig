const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const score: u8 = 100;

    if (score >= 90) {
        print("Congrats!\n", .{});
        print("{s}\n", .{"*" ** 15});
    } else if (score >= 50) {
        print("Congrats!\n", .{});
    } else {
        print("Try again...\n", .{});
    }
}
