const std = @import("std");
const fmt = std.fmt;
const pow = std.math.pow;
const allocator = std.heap.page_allocator;

pub fn isArmstrongNumber(num: u128) bool {
    var sum: u128 = 0;
    var str = fmt.allocPrint(allocator, "{d}", .{num}) catch return false;

    for (str) |c| {
        sum += pow(u128, c - '0', str.len);
    }

    return sum == num;
}
