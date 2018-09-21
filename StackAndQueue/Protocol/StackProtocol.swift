//
//  StackProtocol.swift
//  StackAndQueue
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

protocol StackType {
    
    /// 入栈
    func push(_ item: AnyObject)
    
    /// 出栈
    func pop() -> AnyObject?
    
    /// 获取栈顶元素
    func getTop() -> AnyObject?
    
    /// 栈的长度
    func stackLength() -> Int
    
    /// 判断栈是否为空
    func stackIsEmpty() -> Bool
    
    /// 清除栈中的元素
    func clearStack()
    
    /// 对栈中的元素，从上到下进行遍历输出
    func display()
}
