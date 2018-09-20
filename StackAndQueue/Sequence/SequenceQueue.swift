//
//  SequenceQueue.swift
//  StackAndQueue
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

class SequenceQueue: QueueType {
    fileprivate var queueItems: Array<AnyObject>
    
    init() {
        queueItems = []
    }
    
    /// 获取队头结点值
    ///
    /// - Returns: 头结点
    func getHead() -> AnyObject? {
        if queueIsEmpty() {
            print("队列为空")
            return nil
        }
        return queueItems[0]
    }
    
    /// 进入队列
    ///
    /// - Parameter item: 空
    func enQueue(_ item: AnyObject) {
        queueItems.append(item)
    }
    
    /// 获取尾结点值
    ///
    /// - Returns: 返回队尾的结点值
    func getTail() -> AnyObject? {
        if queueIsEmpty() {
            print("队列为空")
            return nil
        }
        return queueItems[queueLength() - 1]
    }
    
    /// 出队列
    ///
    /// - Returns: 出队列的值
    func deQueue() -> AnyObject? {
        if queueIsEmpty() {
            print("队列为空")
            return nil
        }
        return queueItems.removeFirst()
    }
    
    /// 队列的长度
    ///
    /// - Returns: 队列中元素的个数
    func queueLength() -> Int {
        return queueItems.count
    }
    
    /// 判断队列是否为空
    ///
    /// - Returns: true - 空，  false - 不为空
    func queueIsEmpty() -> Bool {
        return queueItems.isEmpty
    }
    
    func clearQueue() {
        queueItems.removeAll()
    }
    
    /// 遍历输出队列中的值
    func disPlay() {
        for item in queueItems {
            print(item, separator: "", terminator: "<-")
        }
        print("end\n")
    }
    
    
    
}
