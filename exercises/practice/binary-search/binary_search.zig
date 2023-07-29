// Take a look at the tests, you might have to change the function arguments

pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    comptime switch (@typeInfo(T)) {
        .Int, .Float => {},
        else => @compileError("Binary Search only works with int and float"),
    };
    if (items.len == 0) return null;
    const pivot: usize = @divFloor(items.len, 2);
    const value = items[pivot];
    if (value == target) return pivot;
    if (items.len == 1) return null;
    const left = items[0..pivot];
    const right = items[pivot..];
    const half = if (target > value) right else left;
    const search = binarySearch(T, target, half);
    if (search) |s| {
        return if (target > value) s + left.len else s;
    } else return search;
}
