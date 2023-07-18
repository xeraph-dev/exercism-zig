const std = @import("std");
const ascii = std.ascii;
const print = std.debug.print;

pub fn isValid(s: []const u8) bool {
    var sum: usize = 0;
    var i: usize = 1;
    for (1..(s.len + 1)) |ci| {
        var c = s[s.len - ci];
        if (c == ' ') continue;
        if (!ascii.isDigit(c)) return false;
        var n = c - '0';
        if (i % 2 == 0) {
            n *= 2;
            if (n > 9) n -= 9;
        }
        sum += n;
        i += 1;
    }
    return i > 2 and sum % 10 == 0;
}
