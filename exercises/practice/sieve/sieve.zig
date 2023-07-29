const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    var map = std.AutoHashMap(u32, bool).init(std.heap.page_allocator);
    defer map.deinit();
    var z: usize = 0;
    var i: u32 = 2;
    while (i <= limit) : (i += 1) {
        const v = map.get(i);
        if (v) |_| continue else {
            buffer[z] = i;
            z += 1;
        }
        var j = i;
        while (j <= limit) : (j += i) if (v == null) map.put(j, true) catch unreachable;
    }
    return buffer[0..z];
}
