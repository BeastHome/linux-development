const std = @import("std");
const print = std.debug.print;
const user_input = std.io.getStdIn().reader();

pub fn main() !void {
    print("Enter your name: ", .{});
    var buffer: [100]u8 = undefined;
    const person_name = try user_input.readUntilDelimiter(&buffer, '\n');
    print("Your name is {s}.\n", .{person_name});
}
