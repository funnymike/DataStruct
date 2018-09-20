//
//  LinkListProtocal.swift
//  ListDataStruct
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

protocol LinkListType {
    
    func count() -> UInt
    
    // MARK: - 链表的创建
    /// 根据数组正向创建链表
    ///
    /// - Parameter items: 数组
    /// - Returns: true-创建成功， false-创建失败
    func forwardDirectionCreateList(items: Array<AnyObject>) -> Bool
    
    /// 根据数组逆向创建数组
    ///
    /// - Parameter items: 数组
    /// - Returns: true-创建成功， false-创建失败
    func reverseDirectionCreateList(items: Array<AnyObject>) -> Bool
    
    // MARK: - 链表元素的增加
    /// 往链表前方追加元素
    ///
    /// - Parameter item: 所追加的元素
    /// - Returns: true-追加成功，false-追加失败
    func addItemToTail(item: AnyObject) -> Bool
    
    /// 往链表后方追加元素
    ///
    /// - Parameter item: 所追加的元素
    /// - Returns: true-追加成功，false-追加失败
    func addItemToHead(item: AnyObject) -> Bool
    
    /// 根据指定索引来插入item
    ///
    /// - Parameters:
    ///   - item: 插入链表中的元素
    ///   - index: 要插入的位置（0-length）
    /// - Returns: true-插入成功，false-插入失败
    func insertItem(item: AnyObject, index: UInt) -> Bool
    
    //MARK: - 链表元素的移除
    /// 正向移除链表中所有的数据
    func removeAllItemFromHead()
    
    /// 逆向移除链表中所有的数据
    func removeAllItemFromLast()
    
    /// 移除第一个元素
    ///
    /// - Returns: 移除成功就返回节点数据，如果移除失败则返回nil
    func removeFistNote() -> AnyObject?
    
    /// 移除最后一个节点
    ///
    /// - Returns: 被移除的节点值, 如果移除失败则返回nil
    func removeLastNote() -> AnyObject?
    
    /// 根据索引移除节点
    ///
    /// - Parameter index: 根据索引移除节点
    /// - Returns: 被移除的节点值
    func removeItem(index: UInt) -> AnyObject?
    
    //MARK: - 链表的遍历
    /// 单向链表的遍历
    func display()
    
    // MARK: - 数据验证
    /// 检查index是否合法
    ///
    /// - Parameter index: 索引
    /// - Returns: true合法，false不合法
    func checkIndex(index: UInt) -> Bool
}
