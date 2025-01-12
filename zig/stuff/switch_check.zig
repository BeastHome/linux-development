const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const score: u8 = 100;

    switch (score) {
        90...100 => {
            print("Congrats!\n", .{});
            print("{s}\n", .{"*" ** 10});
        },
        50...89 => {
            print("Congrats!\n", .{});
        },
        else => {
            print("Try again...\n", .{});
        },
    }
}
