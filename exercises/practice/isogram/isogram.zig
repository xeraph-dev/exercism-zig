const ascii = @import("std").ascii;

pub fn isIsogram(str: []const u8) bool {
    var list = [_]bool{false} ** 26;
    for (str) |s| {
        if (s == ' ' or s == '-') continue;
        var c = ascii.toLower(s) - 'a';
        if (list[c]) return false;
        list[c] = true;
    }
    return true;
}
