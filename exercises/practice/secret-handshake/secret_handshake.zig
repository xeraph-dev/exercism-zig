const std = @import("std");
const mem = std.mem;

pub const Signal = enum { wink, double_blink, close_your_eyes, jump };

pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![]const Signal {
    var stack = std.ArrayList(Signal).init(allocator);

    if (number >= 1 and number <= 31) {
        if ((number | 0b11110) ^ 0b11110 == 0b00001) try stack.append(.wink);
        if (((number >> 1) | 0b11110) ^ 0b11110 == 0b00001) try stack.append(.double_blink);
        if (((number >> 2) | 0b11110) ^ 0b11110 == 0b00001) try stack.append(.close_your_eyes);
        if (((number >> 3) | 0b11110) ^ 0b11110 == 0b00001) try stack.append(.jump);
        if (((number >> 4) | 0b11110) ^ 0b11110 == 0b00001) {
            defer stack.deinit();
            var reversed = std.ArrayList(Signal).init(allocator);
            while (true) {
                if (stack.popOrNull()) |el| try reversed.append(el) else break;
            }
            return reversed.toOwnedSlice();
        }
    }

    return stack.toOwnedSlice();
}
