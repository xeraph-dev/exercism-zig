const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    return isFlipped(score, @as(u8, 1) << @intFromEnum(allergen));
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    var set = EnumSet(Allergen).initEmpty();
    const fixed: u8 = @truncate(score - 256 * @divFloor(score, 256));
    for (0..8) |i| {
        const allergen: Allergen = @enumFromInt(i);
        if (isAllergicTo(fixed, allergen)) set.insert(allergen);
    }
    return set;
}

inline fn isFlipped(number: u8, bit_mask: u8) bool {
    return (number & bit_mask) > 0;
}
