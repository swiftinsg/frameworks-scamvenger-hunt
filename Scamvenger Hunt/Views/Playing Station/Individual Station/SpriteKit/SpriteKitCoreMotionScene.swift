//
//  SpriteKitCoreMotionScene.swift
//  Scamvenger Hunt
//
//  Created by Jia Chen Yee on 8/31/24.
//

import SpriteKit
import CoreMotion

class SpriteKitCoreMotionScene: SKScene {
    
    var mazeIndex: Int!
    
    var ballNode: SKNode!
    var mazeNode: SKSpriteNode!
    var motionManager: CMMotionManager!
    
    var onComplete: (() -> Void)!
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = .zero
        
        setUpCoreMotion()
        
        setUpMazeNode()
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.setUpBall()
            self.setUpCamera()
        }
    }
    
    func setUpCoreMotion() {
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
    }
    
    func setUpMazeNode() {
        let imageNode = SKSpriteNode(imageNamed: "maze\(mazeIndex!)")
        imageNode.size = CGSize(width: 2000, height: 2000) //view!.bounds.size
        
        imageNode.position = view!.center
        imageNode.physicsBody = SKPhysicsBody(texture: imageNode.texture!, size: imageNode.size)
        imageNode.physicsBody?.isDynamic = false
        imageNode.physicsBody?.pinned = true
        imageNode.physicsBody?.usesPreciseCollisionDetection = true
        
        self.mazeNode = imageNode
        
        addChild(imageNode)
    }
    
    func setUpBall() {
        let radius = mazeNode.size.width * (5 / 324)
        
        let node = SKShapeNode(circleOfRadius: radius)
        
        node.fillColor = .red
        
        if mazeIndex <= 2 {
            node.position = view!.center
        } else {
            node.position = CGPoint(x: mazeNode.frame.midX, y: mazeNode.frame.maxY - radius)
        }
        
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        node.physicsBody?.isDynamic = true
        node.physicsBody?.pinned = false
        
        ballNode = node
        
        addChild(node)
    }
    
    func setUpCamera() {
        let camera = SKCameraNode()
        
        scene?.addChild(camera)
        
        self.camera = camera
        
        camera.constraints = [.distance(.init(constantValue: 0), to: ballNode)]
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -50, dy: accelerometerData.acceleration.x * 50)
        }
        
        if ballNode != nil {
            if mazeIndex <= 2 {
                if !mazeNode.frame.contains(ballNode.position) {
                    onComplete()
                }
            } else {
                if ballNode.position.y < mazeNode.frame.minY {
                    print("hello")
                    onComplete()
                }
            }
        }
    }
}
