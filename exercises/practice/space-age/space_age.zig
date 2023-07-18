const BaseAge = 31_557_600;

pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        var p_age: f64 = switch (self) {
            .mercury => BaseAge * 0.2408467,
            .venus => BaseAge * 0.61519726,
            .earth => BaseAge,
            .mars => BaseAge * 1.8808158,
            .jupiter => BaseAge * 11.862615,
            .saturn => BaseAge * 29.447498,
            .uranus => BaseAge * 84.016846,
            .neptune => BaseAge * 164.79132,
        };
        return @as(f64, @floatFromInt(seconds)) / p_age;
    }
};
