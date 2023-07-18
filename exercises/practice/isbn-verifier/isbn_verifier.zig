const std = @import("std");
const ascii = std.ascii;
const math = std.math;

pub fn isValidIsbn10(s: []const u8) bool {
    var sum: usize = 0;
    var ns = [_]u8{0} ** 10;
    var i: usize = 0;
    for (s, 0..) |c, ci| {
        if (i >= 10) return false;
        if (c == '-') continue;
        if (ci == s.len - 1 and c == 'X') {
            ns[i] = 10;
        } else if (!ascii.isDigit(c)) {
            return false;
        } else {
            ns[i] = c - '0';
        }
        i += 1;
    }
    if (i != 10) return false;
    for (ns, 0..) |n, e| {
        sum += n * (10 - e);
    }
    return sum % 11 == 0;
}
