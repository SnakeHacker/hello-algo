// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 查看本地CPU架构和操作系统信息
    var native_target_info = try std.zig.system.NativeTargetInfo.detect(std.zig.CrossTarget{});
    std.debug.print("Native Info: CPU Arch = {}, OS = {}\n", .{native_target_info.target.cpu.arch, native_target_info.target.os.tag});

    // 初始化二叉树
    // 初始化结点
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // 构建引用指向（即指针）
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("初始化二叉树\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // 插入与删除结点
    var p = inc.TreeNode(i32){ .val = 0 };
    // 在 n1 -> n2 中间插入结点 P
    n1.left = &p;
    p.left = &n2;
    std.debug.print("插入结点 P 后\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // 删除结点
    n1.left = &n2;
    std.debug.print("删除结点 P 后\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    const getchar = try std.io.getStdIn().reader().readByte();
    _ = getchar;
}

