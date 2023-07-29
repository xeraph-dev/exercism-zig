pub fn LinkedList(comptime T: type) type {
    return struct {
        const Self = @This();

        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,

        pub fn push(self: *Self, node: *Node) void {
            self.len += 1;
            node.prev = self.last;
            if (self.last) |last| last.next = node;
            if (self.first == null) self.first = node;
            self.last = node;
        }

        pub fn pop(self: *Self) ?*Node {
            if (self.len > 0) self.len -= 1;
            const node = self.last;
            if (self.last) |last| {
                last.next = null;
                self.last = last.prev;
            }
            return node;
        }

        pub fn shift(self: *Self) ?*Node {
            if (self.len > 0) self.len -= 1;
            const node = self.first;
            if (self.first) |first| {
                first.prev = null;
                self.first = first.next;
            }
            return node;
        }

        pub fn unshift(self: *Self, node: *Node) void {
            self.len += 1;
            node.next = self.first;
            if (self.first) |first| first.prev = node;
            if (self.last == null) self.last = node;
            self.first = node;
        }

        pub fn delete(self: *Self, node: *Node) void {
            var curr = self.first;
            while (true) {
                if (curr) |el| {
                    if (el.data == node.data) {
                        if (el.prev) |prev| prev.next = el.next else self.first = el.next;
                        if (el.next) |next| next.prev = el.prev else self.last = el.prev;
                        if (self.len > 0) self.len -= 1;
                        break;
                    } else curr = el.next;
                } else break;
            }
        }
    };
}
