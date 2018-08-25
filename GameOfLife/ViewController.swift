//
//  ViewController.swift
//  GameOfLife
//
//  Created by Brandon Devereaux on 4/27/18.
//  Copyright © 2018 Brandon Devereaux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var world : World?

    @IBOutlet weak var worldImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width = worldImageView.frame.width * UIScreen.main.scale
        let height = worldImageView.frame.height * UIScreen.main.scale
        world = World(width: Int(width / 12), height: Int(height / 12))
//        worldImageView.contentMode = UIViewContentMode.scaleAspectFill
//        setupWorldAtRandom()
        setupWorld()
        
        drawWorld()
        print("world is \(world!.width) pixels wide and \(world!.height) pixels tall")
        
        
        Timer.scheduledTimer(timeInterval: 0.1,  target: self, selector: #selector(ViewController.updateState), userInfo: nil, repeats: true)
    }
    
    @objc
    func updateState() {
        world?.world = world!.update()
        drawWorld()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        world?.world = world!.update()
        drawWorld()
    }
    private func drawWorld() {

        let width = worldImageView.frame.width * UIScreen.main.scale
        let height = worldImageView.frame.height * UIScreen.main.scale
        
//        let size = CGSize(width: worldImageView.bounds.width, height: worldImageView.bounds.height)
        let size = CGSize(width: world!.width * 12, height: world!.height * 12)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        UIColor.black.setFill()
        //draw everything into context
        if(world != nil) {
            for i in 0..<world!.width {
                for j in 0..<world!.height {
                    if(world!.world[i][j]) {
                        UIColor.green.setFill()
                        let rect = CGRect(x: i * 12, y: j * 12, width: 12, height: 12)
                        UIRectFill(rect)
                    }
//                    else {
//                        UIColor.black.setFill()
//                    }
//                    let rect = CGRect(x: i * 12, y: j * 12, width: 12, height: 12)
//                    UIRectFill(rect)
                }
            }
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        worldImageView.image = image
        worldImageView.clipsToBounds = true
    }
    
    private func setupWorldAtRandom() {
        for i in 0..<world!.width {
            for j in 0..<world!.height {
                let n = Int(arc4random_uniform(11))
                world!.setCell(i, j, n < 5)
            }
        }
    }
    
    private func setupWorld() {
        
        world!.setCell(1, 5)
        world!.setCell(1, 6)
        world!.setCell(2, 5)
        world!.setCell(2, 6)
        
        world!.setCell(13, 3)
        world!.setCell(14, 3)
        world!.setCell(12, 4)
        world!.setCell(11, 5)
        world!.setCell(11, 6)
        world!.setCell(11, 7)
        world!.setCell(12, 8)
        world!.setCell(13, 9)
        world!.setCell(14, 9)
        world!.setCell(15, 6)
        world!.setCell(16, 8)
        world!.setCell(16, 4)
        world!.setCell(17, 5)
        world!.setCell(17, 6)
        world!.setCell(17, 7)
        world!.setCell(18, 6)
        world!.setCell(21, 5)
        world!.setCell(21, 4)
        world!.setCell(21, 3)
        world!.setCell(22, 3)
        world!.setCell(22, 4)
        world!.setCell(22, 5)
        world!.setCell(23, 6)
        world!.setCell(23, 2)
        world!.setCell(25, 1)
        world!.setCell(25, 2)
        world!.setCell(25, 6)
        world!.setCell(25, 7)
        
        world!.setCell(35, 3)
        world!.setCell(35, 4)
        world!.setCell(36, 4)
        world!.setCell(36, 3)
    }
    
}

