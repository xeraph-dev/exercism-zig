const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var list = std.ArrayList(u8).init(allocator);
    var last = false;

    for (words) |c| {
        switch (c) {
            'a'...'z', 'A'...'Z', '\'' => {
                if (last) continue else last = true;
            },
            else => last = false,
        }
        switch (c) {
            'a'...'z' => try list.append(c - 32),
            'A'...'Z' => try list.append(c),
            else => {},
        }
    }

    return list.toOwnedSlice();
}
