const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var list = std.ArrayList(u8).init(allocator);
    defer list.deinit();

    for (s) |c| {
        switch (c) {
            '(', '[', '{' => {
                try list.append(c);
                continue;
            },
            ')', ']', '}' => {
                if (list.popOrNull()) |last|
                    if ((last == '(' and c == ')') or (last == '[' and c == ']') or (last == '{' and c == '}')) continue;
            },
            else => continue,
        }
        return false;
    }

    return list.items.len == 0;
}
