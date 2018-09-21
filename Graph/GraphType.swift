//
//  GraphType.swift
//  Graph
//
//  Created by ketianxiahui on 2018/9/21.
//  Copyright © 2018年 ketianxiahui. All rights reserved.
//

import Foundation

protocol GraphType {
    /// 根据节点数据以及节点关系来创建图
    ///
    /// - Parameters:
    ///   - notes: 节点数据
    ///   - relation: 节点关系
    func createGraph(notes: Array<Any>, relation: Array<(Any,Any,Any)>)
    
    /// BFS: 广度优先搜索
    func breadthFirstSearch()
    
    /// DFS: 深度优先搜索
    func depthFirstSearch()
    
    /// 输出图的物理存储结构
    func displayGraph()
    
    /// 创建最小生成树: Prim
    func createMiniSpanTreePrim()
    
    /// 创建最小生成树: Kruskal
    func createMiniSpanTreeKruskal()
    
    /// 层次遍历最小生成树
    func breadthFirstSearchTree()
    
    /// 最短路径--迪杰斯特拉算法
    func shortestPathDijkstra(beginIndex: Int, endIndex: Int)
}
