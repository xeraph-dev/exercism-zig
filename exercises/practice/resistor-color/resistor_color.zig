pub const ColorBand = enum(usize) {
    black,
    brown,
    red,
    orange,
    yellow,
    green,
    blue,
    violet,
    grey,
    white,
};
pub const ColorBandLen = 10;

pub fn colorCode(color: ColorBand) usize {
    return @intFromEnum(color);
}

pub fn colors() []const ColorBand {
    var cs: [ColorBandLen]ColorBand = undefined;
    for (0..ColorBandLen) |c| cs[c] = @enumFromInt(c);
    return &cs;
}
