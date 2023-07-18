const std = @import("std");
const math = std.math;

pub const Coordinate = struct {
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x = x_coord, .y = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const r: f32 = math.sqrt(math.pow(f32, self.x, 2) + math.pow(f32, self.y, 2));
        if (r <= 1) return 10;
        if (r <= 5) return 5;
        if (r <= 10) return 1;
        return 0;
    }
};
