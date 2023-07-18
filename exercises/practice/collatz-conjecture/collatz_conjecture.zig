pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) ComputationError!usize {
    if (number < 1) return ComputationError.IllegalArgument;
    var n: usize = number;
    var s: usize = 0;
    while (n != 1) {
        if (n % 2 == 0) {
            n /= 2;
        } else {
            n = 3 * n + 1;
        }
        s += 1;
    }
    return s;
}
