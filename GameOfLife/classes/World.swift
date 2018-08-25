//
//  World.swift
//  GameOfLife
//
//  Created by Brandon Devereaux on 4/27/18.
//  Copyright © 2018 Brandon Devereaux. All rights reserved.
//

import Foundation

class World {
    var world: Array<Array<Bool>>
    var width: Int
    var height: Int
    
    required init(width: Int, height: Int) {
        self.width = width
        self.height = height
        world = Array()
        for i in 0..<width {
            world.append(Array())
            for _ in 0..<height {
                world[i].append(false)
            }
        }
    }
    
    func setCell(_ x: Int, _ y: Int, _ alive: Bool = true) {
        world[x][y] = alive
    }
    
    private func getNeighborCount(_ x: Int, _ y: Int) -> Int {
        if(x < 0 || x >= self.width) {
            return -1// means we're checking an invalid coordinate
        }
        else if(y < 0 || y >= self.height) {
            return -1// means we're checking an invalid coordinate
        }
        else {
            var liveNeighborCount = 0
            var hasLeft = false
            var hasRight = false
            if(x - 1 >= 0) {// has left
                hasLeft = true
                liveNeighborCount += world[x-1][y] ? 1 : 0// left
            }
            if(x + 1 < self.width) {// has right
                hasRight = true
                liveNeighborCount += world[x+1][y] ? 1 : 0// right
            }
            if(y - 1 >= 0) {// has top
                liveNeighborCount += world[x][y-1] ? 1 : 0// top
                if(hasLeft) {
                    liveNeighborCount += world[x-1][y-1] ? 1 : 0// top left
                }
                if(hasRight) {
                    liveNeighborCount += world[x+1][y-1] ? 1 : 0// top right
                }
            }
            if(y + 1 < self.height) {// has bottom
                liveNeighborCount += world[x][y+1] ? 1 : 0//bottom
                if(hasLeft) {
                    liveNeighborCount += world[x-1][y+1] ? 1 : 0//bottom left
                }
                if(hasRight) {
                    liveNeighborCount += world[x+1][y+1] ? 1 : 0// bottom right
                }
            }
            return liveNeighborCount
        }
    }
    
    func update() -> Array<Array<Bool>>{
        var newWorld = Array<Array<Bool>>()
        for i in 0..<width {
            newWorld.append(Array<Bool>())
            for j in 0..<height {
                let neighborCount = getNeighborCount(i, j)
                if(world[i][j]) {// cell is alive
                    if(neighborCount == 2 || neighborCount == 3) {
                        newWorld[i].append(true)
                    }
                    else {
                        newWorld[i].append(false)
                    }
                }
                else {// cell is dead
                    if(neighborCount == 3) {
                        newWorld[i].append(true)
                    }
                    else {
                        newWorld[i].append(false)
                    }
                }
            }
        }
        return newWorld
    }
}
