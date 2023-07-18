const std = @import("std");
const math = std.math;

pub fn squareOfSum(number: usize) usize {
    var r: usize = 0;
    for (0..(number + 1)) |n| {
        r += n;
    }
    return math.pow(usize, r, 2);
}

pub fn sumOfSquares(number: usize) usize {
    var r: usize = 0;
    for (0..(number + 1)) |n| {
        r += math.pow(usize, n, 2);
    }
    return r;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
