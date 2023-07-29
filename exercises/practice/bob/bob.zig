pub fn response(s: []const u8) []const u8 {
    if (issilence(s)) return "Fine. Be that way!";
    if (isyellingquestion(s)) return "Calm down, I know what I'm doing!";
    if (isyelling(s)) return "Whoa, chill out!";
    if (isquestion(s)) return "Sure.";
    return "Whatever.";
}

fn isquestion(s: []const u8) bool {
    const str = @import("std").mem.trimRight(u8, s, " \n\t\r");
    return str[str.len - 1] == '?';
}

fn isyelling(s: []const u8) bool {
    var len: usize = 0;
    var n: usize = 0;
    for (s) |c| {
        switch (c) {
            'a'...'z' => {},
            'A'...'Z' => {
                len += 1;
                n += 1;
            },
            else => len += 1,
        }
    }
    return n > 0 and len == s.len;
}

fn isyellingquestion(s: []const u8) bool {
    return isquestion(s) and isyelling(s);
}

fn issilence(s: []const u8) bool {
    var len: usize = 0;
    for (s) |c| {
        switch (c) {
            ' ', '\t', '\n', '\r' => len += 1,
            else => {},
        }
    }
    return len == s.len;
}
