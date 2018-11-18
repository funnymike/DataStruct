//
//  SortClass.swift
//  AllKindsOfSort
//
//  Created by 黄炎 on 2018/11/18.
//  Copyright © 2018 ketianxiahui. All rights reserved.
//

import Foundation

/// 冒泡排序：时间复杂度---O(n^2)
class BubbleSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        print("冒泡排序")
        var list = items
        print("排序的数组为：\(list)\n")
        for i in 0..<list.count {
            print("第\(i+1)轮冒泡：")
            var j = list.count - 1
            while j > i {
                if list[j - 1] > list[j] { //当前边大于后边，进行交换
                    print("\(list[j - 1]) > \(list[j]): 进行交换")
                    let temp = list[j]
                    list[j] = list[j - 1]
                    list[j - 1] = temp
                } else{
                    print("\(list[j - 1]) <= \(list[j]): 不进行交换")
                }
                j = j - 1
            }
            print("第\(i + 1)轮冒泡结束，当前结果为：")
            print("\(list)\n")
        }
        return list
    }
}

/// 插入排序
class InsertSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        print("插入排序")
        var list = items
        print("排序的数组为：\(list)\n")
        for i in 1..<list.count {
            print("第\(i)轮插入：")
            print("要选择的插入值为：\(list[i])")
            var j = i
            while j > 0 {
                if list[j] < list[j - 1] {
                    let temp = list[j]
                    list[j] = list[j - 1]
                    list[j - 1] = temp
                    j = j - 1
                }else{
                    break
                }
            }
            print("插入的位置为：\(j)")
            print("本轮插入完毕，插入结果为：\n\(list)\n")
        }
        return list
    }
}

/// 希尔排序：时间复杂度 --- O(n^(3/2))
class ShellSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        print("希尔排序")
        var list = items
        print("排序的数组为：\(list)\n")
        var step: Int = list.count / 2
        while step > 0 {
            print("步长\(step)的插入排序开始")
            for i in 0..<list.count {
                var j = i + step
                while j >= step && j < list.count {
                    if list[j] < list[j - step]{
                        let temp = list[j]
                        list[j] = list[j - step]
                        list[j - step] = temp
                        j = j - step
                    }else{
                        break
                    }
                }
            }
            print("步长为\(step)的插入排序结束")
            print("本轮排序结果为：\(list)\n")
            step = step / 2 //缩小步长
        }
        return list
    }
}

class SimpleSelectionSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        print("简单的选择排序")
        var list = items
        print("排序的数组为：\(list)\n")
        for i in 0..<list.count {
            print("第\(i + 1)轮选择，选择的下标范围为\(i) -- \(list.count)")
            var j = i + 1
            var minValue = list[i]
            var minIndex = i
            
            // 寻找无序中的最小值
            while j < list.count {
                if minValue > list[j] {
                    minValue = list[j]
                    minIndex = j
                }
                j = j + 1
            }
            print("在后半部分轮序数列中，最小值为：\(minValue)，下标为：\(minIndex)")
            //与无序表中的第一个交换，让其成为有序表中的最后一个值
            if minIndex != 1 {
                print("\(minIndex)与\(list[i])交换")
                let temp = list[i]
                list[i] = list[minIndex]
                list[minIndex] = temp
            }
            print("本轮结果为：\(list)\n")
        }
        return list
    }
}

/// 堆排序
class HeapSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        print("堆排序")
        var list = items
        print("排序的数组为：\(list)\n")
        var endIndex = items.count - 1
        
        //创建大顶堆，其实就是将list转换成大顶堆层次的遍历结果
        heapCreate(items: &list)
        print("原始堆：\(list)")
        while endIndex >= 0 {
            //将大顶堆得顶点（最大的那个值）与大顶堆的最后一个值进行交换
            print("将list[0]: \(list[0])与list[\(endIndex)]:\(list[endIndex])交换")
            let temp = list[0]
            list[0] = list[endIndex]
            list[endIndex] = temp
            endIndex -= 1 //缩小大顶堆得范围
            //对交换后的大顶堆进行调整，使其重新成为大顶堆
            heapAdjast(items: &list, startIndex: 0, endIndex: endIndex + 1)
            print("调整后：\(list)\n")
        }
        return list
    }
    
    /// 构建大顶堆得层次遍历 (f(i) > f(2i), f(i) > f(2i + 1) i > 0)
    ///
    /// - Parameter items: 构建大顶堆得序列
    func heapCreate(items: inout Array<Int>) {
        var i = items.count
        while i > 0 {
            heapAdjast(items: &items, startIndex: i - 1, endIndex: items.count)
            i -= 1
        }
    }
    
    /// 对大顶堆得局部进行l跳转，使其该结点的所有父类符合大顶堆得特点
    func heapAdjast(items: inout Array<Int>, startIndex: Int, endIndex: Int) {
        let temp = items[startIndex]
        var fatherIndex = startIndex + 1 //父节点下标
        var maxChildIndex = 2 * fatherIndex //左孩子结点
        
        while maxChildIndex <= endIndex {
            //比较左右孩子并找出比较大的下标
            if maxChildIndex < endIndex && items[maxChildIndex - 1] < items[maxChildIndex] {
                maxChildIndex = maxChildIndex + 1
            }
            
            //如果比较大的那个子节点比根结点大，就将该结点的值赋值给父节点
            if temp < items[maxChildIndex - 1] {
                items[fatherIndex-1] = items[maxChildIndex-1]
            } else{
                break
            }
            fatherIndex = maxChildIndex
            maxChildIndex = 2 * fatherIndex
        }
        items[fatherIndex-1] = temp
    }
}

/// 归并排序
class MerginSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        print("归并排序")
        
        //将数组中的每一个元素放入一个数组中
        var tempArray: Array<Array<Int>> = []
        for item in items {
            var subArray: Array<Int> = []
            subArray.append(item)
            tempArray.append(subArray)
        }
        
        //对这个数组中的数组进行合并，直到合并完为止
        while tempArray.count != 1 {
            print(tempArray)
            var i = 0
            while i < tempArray.count - 1{
                print("将\(tempArray[i])与\(tempArray[i+1])合并")
                tempArray[i] = mergeArray(firstList: tempArray[i], secondList: tempArray[i+1])
                print("合并结果为：\(tempArray[i])\n")
                tempArray.remove(at: i + 1)
                i += 1
            }
        }
        return tempArray.first!
    }
    
    /// 将两个有序数组进行合并
    ///
    /// - Parameters:
    ///   - firstList: 第一个有序数组
    ///   - secondList: 第二个有序数组
    /// - Returns: 返回排序好的数组
    func mergeArray(firstList: Array<Int>, secondList: Array<Int>) -> Array<Int> {
        var resultList: Array<Int> = []
        var firstIndex = 0
        var secondIndex = 0
        
        while firstIndex < firstList.count && secondIndex < secondList.count {
            if firstList[firstIndex] < secondList[secondIndex] {
                resultList.append(firstList[firstIndex])
                firstIndex += 1
            } else {
                resultList.append(secondList[secondIndex])
                secondIndex += 1
            }
        }
        
        while firstIndex < firstList.count {
            resultList.append(firstList[firstIndex])
            firstIndex += 1
        }
        
        while secondIndex < secondList.count {
            resultList.append(secondList[secondIndex])
            secondIndex += 1
        }
        return resultList
    }
}

class QuickSort: SortType {
    func sort(items: Array<Int>) -> Array<Int> {
        var list = items
        print("快速排序")
        print("排序的数组为：\(list)\n")
        quickSort(list: &list, low: 0, high: list.count-1)
        print("快速排序结束")
        return list
    }
    
    /// 快速排序
    ///
    /// - Parameters:
    ///   - list: 要排序的数组
    ///   - low: 数组的下界
    ///   - high: 数组的上界
    private func quickSort(list: inout Array<Int>, low: Int, high: Int) {
        if low < high {
            let mid = partition(list: &list, low: low, high: high)
            quickSort(list: &list, low: low, high: mid - 1) //递归前半部分
            quickSort(list: &list, low: mid + 1, high: high) //递归后半部分
        }
    }
    
    /// 把数组以第一个值为准分为两部分，前半部分比该值小，后半部分比该值大
    ///
    /// - Parameters:
    ///   - list: 要分的数组
    ///   - low: 数组的下界
    ///   - high: 数组的上界
    /// - Returns: 分界点
    private func partition(list: inout Array<Int>, low: Int, high: Int) -> Int {
        var low = low
        var high = high
        let temp = list[low]
        print("low[\(low)]:\(list[low]), high[\(high)]:\(list[high])")
        while low < high {
            while low < high && list[high] >= temp {
                high -= 1
            }
            list[low] = list[high]
            
            while low < high && list[low] <= temp {
                low += 1
            }
            list[high] = list[low]
        }
        list[low] = temp
        print("mid[\(low): \(list[low])]")
        print("\(list)\n")
        return low
    }
}
