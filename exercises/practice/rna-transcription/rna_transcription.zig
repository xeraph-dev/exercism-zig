const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    var rna = std.ArrayList(u8).init(allocator);
    for (dna) |c| {
        try switch (c) {
            'G' => rna.append('C'),
            'C' => rna.append('G'),
            'T' => rna.append('A'),
            'A' => rna.append('U'),
            else => unreachable,
        };
    }
    return try rna.toOwnedSlice();
}
