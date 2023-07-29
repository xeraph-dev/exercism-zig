pub const QueenError = error{
    InitializationFailure,
};

pub const Queen = struct {
    row: i8,
    col: i8,

    pub fn init(row: i8, col: i8) QueenError!Queen {
        if (row >= 0 and row < 8 and col >= 0 and col < 8) return Queen{ .row = row, .col = col };
        return error.InitializationFailure;
    }

    pub fn canAttack(self: Queen, other: Queen) QueenError!bool {
        return self.row == other.row or self.col == other.col or @max(self.row, other.row) - @min(self.row, other.row) == @max(self.col, other.col) - @min(self.col, other.col);
    }
};
