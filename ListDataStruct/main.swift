//
//  main.swift
//  ListDataStruct
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

let array = "a,b,c,d,e,f,g".components(separatedBy: ",")

func testSqueueList() {
    let sequcenceList: SequenceList = SequenceList(capacity: 10)
    
    for item in array {
        sequcenceList.addItem(item)
    }
    sequcenceList.displayList()
    
    let insertResult = sequcenceList.insert("z", index: 0)
    let removeResult = sequcenceList.removeItem(1)
    let modifyResult = sequcenceList.modify(3, newItem: "m")
    
    if insertResult && removeResult && (modifyResult != nil) {
        sequcenceList.displayList()
    }
}

//testSqueueList()


func testLinkedList(_ list: LinkListType) {
    var callResult =  false
    callResult = list.forwardDirectionCreateList(items: array as Array<AnyObject>)
    if callResult {
        print("正向创建链表")
        list.display()
    }
    print("\n链表正向清空")
    list.removeAllItemFromHead()
    
    callResult = list.reverseDirectionCreateList(items: array as Array<AnyObject>)
    if callResult {
        print("\n逆向创建链表")
        list.display()
    }
    
    print("\n链表逆向清空")
    list.removeAllItemFromLast()
    
    if !list.insertItem(item: "非法" as AnyObject, index: 100) &&
        list.insertItem(item: "header" as AnyObject, index: 0) &&
        list.insertItem(item: "mid" as AnyObject, index: list.count()/2 + 1) &&
        list.insertItem(item: "tail" as AnyObject, index: list.count()) {
        print("\n插入元素")
        list.display()
    }
    
    if (list.removeLastNote() != nil) && (list.removeFistNote() != nil) && (list.removeItem(index: 0) != nil) {
        print("\n移除元素，并返回值")
        list.display()
    }
}

//testLinkedList(OneDirectionLinkList())
testLinkedList(DoubleLinkedList())
