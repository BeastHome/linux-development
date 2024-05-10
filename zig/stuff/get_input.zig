const std = @import("std");

const keyboard = std.io.getStdIn().reader();

pub fn main() !void {
    std.debug.print("Enter your name: ", .{});
    var buffer: [100]u8 = undefined;
    const input = try keyboard.readUntilDelimiter(&buffer, '\n');
    std.debug.print("Your name is {s}.\n", .{input});
}
