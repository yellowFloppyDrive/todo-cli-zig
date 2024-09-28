const std = @import("std");

const Todo = struct {
    id: []const u8,
    title: []const u8,
};

const TodoHashMap = std.StringHashMap(Todo);

const Data = struct {
    todos: TodoHashMap,
};

fn runPrint(comptime fmt: []const u8, args: anytype) void {
    std.debug.print(fmt, args);
}

fn runReadFirstCharacter() u8 {
    const reader = std.io.getStdIn().reader();
    var c: [1]u8 = u8{' '};
    const bytes: usize = reader.read(&c) catch 0;

    if (bytes > 0) {
        var garbage: [1]u8 = undefined;
        var garbage_bytes: usize = undefined;
        while (true) {
            garbage_bytes = reader.read(&garbage) catch 0;

            if (garbage_bytes == 0 or garbage[0] == '\n') {
                break;
            }
        }
    }

    return c[0];
}

fn whenAppStarts(data: *Data) void {
    runPrint("Pick an option (1 - List todos, 2 - Add todo, 3 - Complete todo, 4 - Remove todo, q - Quit)", .{});

    const command = runReadFirstCharacter();

    switch (command) {
        '1' => {
            for (data.todos) |todo| {
                    // TODO: FINISH UP
            }
        },
        '2' => {},
        '3' => {},
        '4' => {},
        'q' => {},
        else => {},
    }
}

pub fn main() void {
    std.debug.print("Hello world", .{});
}
