//
//  LinkStack.swift
//  StackAndQueue
//
//  Created by ketianxiahui on 2018/9/20.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

class LinkStackNote {
    var data: AnyObject
    var next: LinkStackNote?
    
    init(data: AnyObject = "" as AnyObject) {
        self.data = data
    }
    deinit {
        print("\(self.data)释放", separator: "", terminator: ",")
    }
}

class LinkStack: StackType {
    fileprivate var top: LinkStackNote?
    fileprivate var count: Int = 0
    
    func push(_ item: AnyObject) {
        let note = LinkStackNote(data: item)
        note.next = top
        top = note
        count += 1
    }
    
    func pop() -> AnyObject? {
        if !stackIsEmpty() {
            let note = top
            top = top?.next
            count -= 1
            return note?.data
        }
        return nil
    }
    
    func getTop() -> AnyObject? {
        if !stackIsEmpty() {
            return top?.data
        }
        return nil
    }
    
    func stackLength() -> Int {
        return count
    }
    
    func stackIsEmpty() -> Bool {
        return top == nil
    }
    
    func clearStack() {
        while !stackIsEmpty() {
            _ = self.pop()
        }
    }
    
    func display() {
        if stackIsEmpty() {
            print("栈为空")
            return
        }
        var cursor = top
        while cursor != nil {
            print("[_\((cursor?.data)!)_]")
            cursor = cursor?.next
        }
         print("")
    }
}
