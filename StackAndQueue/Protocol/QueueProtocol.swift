//
//  QueueProtocol.swift
//  StackAndQueue
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

protocol QueueType {
    
    /// 获取队头结点值
    func getHead() -> AnyObject?
    
    /// 进入队列
    func enQueue(_ item: AnyObject) -> Void
    
    /// 获取尾结点值
    func getTail() -> AnyObject?
    
    /// 出队列
    func deQueue() -> AnyObject?
    
    /// 队列的长度
    func queueLength() -> Int
    
    /// 判断队列是否为空
    func queueIsEmpty() -> Bool
    
    /// 清空队列中的值
    func clearQueue() -> Void
    
    /// 遍历输出队列中的值
    func disPlay() -> Void
}
