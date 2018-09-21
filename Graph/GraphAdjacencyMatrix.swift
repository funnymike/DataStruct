//
//  GraphAdjacencyMatrix.swift
//  Graph
//
//  Created by ketianxiahui on 2018/9/21.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

let NO_RELATION = 0
let HAVE_RELATION = 1
typealias MGraph = Array<Array<Int>>


class BFSQueue {
    fileprivate var queue: Array<Int> = []
    
    func deQueue() -> Int {
        return queue.removeFirst()
    }
    
    func enQueue(item: Int) {
        queue.append(item)
    }
    
    func queueIsEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func clearElement() {
        queue.removeAll()
    }
}

class GraphAdjacencyMatrix: GraphType {
    
    fileprivate var relationDic: Dictionary<String, Int>
    fileprivate var graph: MGraph
    fileprivate var miniTree: MGraph
    fileprivate var visited: Array<Bool>
    fileprivate var graphData: Array<AnyObject>
    fileprivate var bfsQueue: BFSQueue
    
    init() {
        relationDic = [:]
        graph = []
        miniTree = []
        visited = []
        graphData = []
        bfsQueue = BFSQueue()
    }
    
    func createGraph(notes: Array<Any>, relation: Array<(Any, Any, Any)>) {
        self.graphData = notes as Array<AnyObject>
        configData(notes: notes as Array<AnyObject>)
        
        //根据关系创建图
        for item in relation {
            guard let i = relationDic[item.0 as! String], let j = relationDic[item.1 as! String] else {
                continue
            }
            let weightNumber = Int(truncating: item.2 as! NSNumber)
            graph[i][j] = weightNumber
            graph[j][i] = weightNumber
        }
    }
    
    private func configData(notes: Array<AnyObject>) {
        for i in 0..<notes.count {
            relationDic[notes[i] as! String] = i
        }
        graph = initGraph(count: notes.count)
    }

    private func initGraph(count: Int) -> MGraph {
        var graph: MGraph = MGraph()
        for _ in 0..<count {
            var temp: Array<Int> = []
            for _ in 0..<count {
                temp.append(NO_RELATION) //NO_RELATION = 0
            }
            graph.append(temp)
        }
        return graph
    }
    
    func displayGraph() {
        displayGraph(graph: graph)
    }
    
    private func displayGraph(graph: MGraph) {
        for i in 0..<graph.count {
            for j in 0..<graph[i].count {
                print(graph[i][j], separator: "", terminator: "\t")
            }
            print("")
        }
        print("")
    }
    
    func breadthFirstSearch() {
        print("邻接矩阵：图的广度搜索（BFS）:")
        
    }
    
    fileprivate func initVisited() {
        visited.removeAll()
        for _ in 0..<graph.count {
            visited.append(false)
        }
    }
    
    func depthFirstSearch() {
        <#code#>
    }
    
    func createMiniSpanTreePrim() {
        <#code#>
    }
    
    func createMiniSpanTreeKruskal() {
        <#code#>
    }
    
    func breadthFirstSearchTree() {
        <#code#>
    }
    
    func shortestPathDijkstra(beginIndex: Int, endIndex: Int) {
        <#code#>
    }
    
    

}
