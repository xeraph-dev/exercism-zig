pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index < 1 or index > 64) return ChessboardError.IndexOutOfBounds;
    var sum: usize = 1;
    for (1..index) |_| {
        sum *= 2;
    }
    return sum;
}

pub fn total() u64 {
    var sum: usize = 0;
    for (1..65) |c| {
        sum += square(c) catch unreachable;
    }
    return sum;
}
