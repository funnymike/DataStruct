//
//  main.swift
//  BinaryTree
//
//  Created by ketianxiahui on 2018/9/21.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

let searchTable: Array<Int> = [62, 88, 58, 47, 62, 35, 73, 51, 99, 37, 93]
let binarySearchTree = BinarySearchTree(items: searchTable)

binarySearchTree.deleteNote(key: 99)
binarySearchTree.inOrderTraverse()
