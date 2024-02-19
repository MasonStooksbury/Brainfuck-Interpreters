const std = @import("std");

pub fn getFileData(allocator: *std.mem.Allocator) ![]u8 {
    const file_path = "test.txt";

    const file = try std.fs.cwd().openFile(file_path, .{});
    defer file.close(); // Ensure the file is closed when done

    const file_stat = try file.stat();
    const file_size = file_stat.size;

    var content = try allocator.alloc(u8, file_size);

    _ = try file.readAll(content);

    // Return the slice directly without defer freeing it here.
    return content[0..file_size];
}

pub fn main() !void {
    var allocator = std.heap.page_allocator;

    // Pass a pointer to the allocator
    const data = try getFileData(&allocator);

    // Ensure the data is freed when done
    defer allocator.free(data);

    const max_memory = 10;
    var memory: [max_memory]u8 = undefined;
    @memset(&memory, 0);

    // var mem_ptr = 0;
    // var file_ptr = 0;

    // std.debug.print("File content:\n{str}\n", .{str});

    // std.debug.print("{}", .{str[1]});

    // Loop to print the data
    for (data) |elem| {
        std.debug.print("{} ", .{elem});
    }

    std.debug.print("\n", .{});

    for (memory) |elem| {
        std.debug.print("{} ", .{elem});
    }
}
