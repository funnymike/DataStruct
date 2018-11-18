//
//  main.swift
//  AllKindsOfSort
//
//  Created by 黄炎 on 2018/11/18.
//  Copyright © 2018 ketianxiahui. All rights reserved.
//

import Foundation

func testSort(sortObject: SortType) {
    var list: Array<Int> = []
    var i = 0
    while i < 20 {
        let random = Int(arc4random()%5000)+1000
        list.append(random)
        i += 1
    }
    
    let sortList = sortObject.sort(items: list)
    print(sortList)
    print("\n\n")
}

testSort(sortObject: BubbleSort())
testSort(sortObject: InsertSort())
testSort(sortObject: ShellSort())
testSort(sortObject: SimpleSelectionSort())
testSort(sortObject: HeapSort())
testSort(sortObject: MerginSort())
testSort(sortObject: QuickSort())
