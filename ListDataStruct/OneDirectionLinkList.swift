//
//  OneDirectionLinkList.swift
//  ListDataStruct
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

/// 单向链表的节点
class OneDirectionLinkListNote {
    var data: AnyObject
    var next: OneDirectionLinkListNote?
    
    init(data: AnyObject = "" as AnyObject) {
        self.data = data
    }
    deinit {
        print("\(self.data)释放", separator: "", terminator: ",")
    }
}

class OneDirectionLinkList: LinkListType {
    var headNote: OneDirectionLinkListNote?
    var tailNote: OneDirectionLinkListNote?
    var length: UInt
    
    init() {
        self.headNote = OneDirectionLinkListNote()
        self.tailNote = self.headNote
        self.length = 0
    }
    
    func count() -> UInt {
        return length
    }
    
    // MARK: - 链表的创建
    /// 根据数组正向创建链表
    ///
    /// - Parameter items: 数组
    /// - Returns: true-创建成功， false-创建失败
    func forwardDirectionCreateList(items: Array<AnyObject>) -> Bool {
        for item in items {
            if !self.addItemToTail(item: item) {
                return false
            }
        }
        return true
    }
    
    /// 根据数组逆向创建链表
    ///
    /// - Parameter items: 数组
    /// - Returns: true-创建成功， false-创建失败
    func reverseDirectionCreateList(items: Array<AnyObject>) -> Bool {
        for item in items {
            if !self.addItemToHead(item: item) {
                return false
            }
        }
        return true
    }
    
    // MARK: - 链表元素的增加
    /// 往链表前方追加元素
    ///
    /// - Parameter item: 所追加的元素
    /// - Returns: true-追加成功，false-追加失败
    func addItemToTail(item: AnyObject) -> Bool {
        let newLinkListNote = OneDirectionLinkListNote(data: item)
        if self.tailNote == nil {
            return false
        }
        self.tailNote?.next = newLinkListNote
        self.tailNote = newLinkListNote
        self.length += 1
        return true
    }
    
    /// 往链表后方追加元素
    ///
    /// - Parameter item: 所追加的元素
    /// - Returns: true-追加成功，false-追加失败
    func addItemToHead(item: AnyObject) -> Bool {
        let newLinkListNote = OneDirectionLinkListNote(data: item)
        if self.headNote == nil {
            return false
        }
        newLinkListNote.next = headNote?.next
        self.headNote?.next = newLinkListNote
        self.length += 1
        if length == 1 {
            self.tailNote = newLinkListNote
        }
        return true
    }
    
    /// 根据指定索引来插入item
    ///
    /// - Parameters:
    ///   - item: 插入链表中的元素
    ///   - index: 要插入的位置（0-length）
    /// - Returns: true-插入成功，false-插入失败
    func insertItem(item: AnyObject, index: UInt) -> Bool {
        if !checkIndex(index: index) {
            return false
        }
        if index == 0 {
            return addItemToTail(item: item)
        }
        if index == self.length {
            return addItemToHead(item: item)
        }
        
        var cursor = self.headNote
        for _ in 0..<index {
            cursor = cursor?.next
        }
        let newItem = OneDirectionLinkListNote(data: item)
        newItem.next = cursor?.next
        cursor?.next = newItem
        self.length += 1
        return true
    }
    
    //MARK: - 链表元素的移除
    /// 正向移除链表中所有的数据
    func removeAllItemFromHead() {
        while self.removeFistNote() != nil {
            
        }
    }
    
    /// 逆向移除链表中所有的数据
    func removeAllItemFromLast() {
        while self.removeLastNote() != nil {
            
        }
    }
    
    /// 移除第一个元素
    ///
    /// - Returns: 移除成功就返回节点数据，如果移除失败则返回nil
    func removeFistNote() -> AnyObject? {
        if self.headNote?.next == nil {
            print("链表为空")
            return nil                    //链表为空
        }
        let removeItem = self.headNote?.next
        self.headNote?.next = removeItem?.next
        removeItem?.next = nil
        self.length -= 1
        
        if self.headNote?.next == nil { //如果移除的是最后一个元素，就讲尾指针指向头指针
            self.tailNote = self.headNote
        }
        return removeItem?.data
    }
    
    /// 移除最后一个节点
    ///
    /// - Returns: 被移除的节点值
    func removeLastNote() -> AnyObject? {
        if self.headNote?.next == nil {
            print("链表为空")
            return nil                    //链表为空
        }
        return self.removeItem(index: self.length-1)
    }
    
    /// 根据索引移除节点
    ///
    /// - Parameter index: 索引
    /// - Returns: 被移除的节点值
    func removeItem(index: UInt) -> AnyObject? {
        if self.headNote?.next == nil {
            print("链表为空")
            return nil                    //链表为空
        }
        if !checkIndex(index: index) {
            return nil
        }
        var cursor = self.headNote //遍历节点的游标
        var preCursor = self.headNote //记录一下cursor前面的节点
        
        for i in 0..<self.length { //寻找移除的节点的位置，以及前驱
            preCursor = cursor
            cursor = cursor?.next
            if index == i {
                break
            }
        }
        
        //对节点进行移除
        preCursor?.next = cursor?.next
        cursor?.next = nil
        if index == self.length-1 {
            self.tailNote = preCursor
        }
        self.length -= 1
        return cursor?.data
    }
    
    //MARK: 链表的遍历
    /// 单向链表的遍历
    func display() {
        var currentNote = self.headNote?.next
        for _ in 0..<self.length {
            if currentNote == nil {
                break
            }
            guard let item = currentNote?.data else {
                return
            }
            print(item, separator: "", terminator: " -> ")
            currentNote = currentNote?.next
        }
        print("nil")
    }
    // MARK: - 数据验证
    
    /// 检查index是否合法
    func checkIndex(index: UInt) -> Bool {
        if  index > self.length  {
            print("index非法，请进行检查")
            return false
        }
        return true
    }
    
    
}
