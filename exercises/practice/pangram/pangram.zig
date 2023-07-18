const std = @import("std");
const ascii = std.ascii;

pub fn isPangram(str: []const u8) bool {
    if (str.len < 26) return false;

    var bits: u32 = 0;
    for (str) |s| {
        if (ascii.isASCII(s) and ascii.isAlphabetic(s)) {
            bits |= @as(u32, 1) << @truncate(ascii.toLower(s) - 'a');
        }
    }
    return bits == 0b0011_1111_1111_1111_1111_1111_1111;
}
