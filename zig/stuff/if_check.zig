const std = @import("std");

pub fn main() void {
    const score: u8 = 100;

    if (score >= 90) {
        std.debug.print("Congrats!\n", .{});
        std.debug.print("{s}\n", .{"*" ** 15});
    } else if (score >= 50) {
        std.debug.print("Congrats!\n", .{});
    } else {
        std.debug.print("Try again...\n", .{});
    }
}
