const std = @import("std");
const mem = std.mem;
const fmt = std.fmt;

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    var list = std.ArrayList([]u8).init(allocator);
    if (words.len > 1) {
        for (0..words.len - 1) |i| {
            const left = words[i];
            const right = words[i + 1];
            const str = try fmt.allocPrint(allocator, "For want of a {s} the {s} was lost.\n", .{ left, right });
            try list.append(str);
        }
    }
    if (words.len > 0) {
        const first = words[0];
        const str = try fmt.allocPrint(allocator, "And all for the want of a {s}.\n", .{first});
        try list.append(str);
    }
    return list.toOwnedSlice();
}
