//  Created by Devine Lu Linvega on 2015-10-07.
//  Copyright © 2015 XXIIVV. All rights reserved.

import UIKit
import QuartzCore
import SceneKit
import Foundation

class StructuresLibrary
{
	func none() -> SCNNode
	{
		let mesh = SCNNode()
		return mesh
	}
	
	func placeholder() -> SCNNode
	{
		let mesh = SCNNode()
		let radius:Float = 3
		
		print("! Missing structure")
		
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(-radius,radius,0), nodeB: SCNVector3(0,radius,radius), color: grey))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(0,radius,radius), nodeB: SCNVector3(radius,radius,0), color: grey))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius,radius,0), nodeB: SCNVector3(0,radius,-radius), color: grey))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(0,radius,-radius), nodeB: SCNVector3(-radius,radius,0), color: grey))
		
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(-radius,-radius,0), nodeB: SCNVector3(0,-radius,radius), color: grey))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(0,-radius,radius), nodeB: SCNVector3(radius,-radius,0), color: grey))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius,-radius,0), nodeB: SCNVector3(0,-radius,-radius), color: grey))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(0,-radius,-radius), nodeB: SCNVector3(-radius,-radius,0), color: grey))
		
		return mesh
	}
	
	func satellite(radius:Float = 1.5, color:UIColor = red) -> SCNNode
	{
		let mesh = SCNNode()
		let color:UIColor = cyan
		let sides:Int = Int(arc4random_uniform(7)) + 3
		let verticalOffset:Float = 5
		let radius:Float = Float(20 + arc4random_uniform(5))/10
		
		let rand1 = (Float(arc4random_uniform(100))/100).clamp(0.4, 0.9)
		let rand2 = (Float(arc4random_uniform(100))/100).clamp(0.7, 0.9)
		
		var i = 0
		while i < sides {
			var e = 0
			while e < sides {
				let root = SCNNode()
				root.eulerAngles.y = Float(degToRad(CGFloat(Float(e) * Float(360/sides))))
				mesh.addChildNode(root)
				let branch1 = SCNLine(nodeA: SCNVector3(0,verticalOffset * rand1,radius * rand1 + 1), nodeB: SCNVector3((radius) * rand2,verticalOffset,radius * rand2 - 1), color: color)
				let branch2 = SCNLine(nodeA: SCNVector3(0,verticalOffset * rand1,radius * rand1 + 1), nodeB: SCNVector3((-radius) * rand2,verticalOffset,radius * rand2 - 1), color: color)
				root.addChildNode(branch1)
				root.addChildNode(branch2)
				branch1.addChildNode(SCNLine(nodeA: branch1.nodeB, nodeB: SCNVector3(radius * rand1 * rand2,verticalOffset,1 * rand2), color: grey))
				branch1.addChildNode(SCNLine(nodeA: branch1.nodeB, nodeB: SCNVector3(-radius * rand1 * rand2,verticalOffset,1 * rand2), color: grey))
				branch2.addChildNode(SCNLine(nodeA: branch2.nodeB, nodeB: SCNVector3(radius * rand1 * rand2,verticalOffset,1 * rand2), color: grey))
				branch2.addChildNode(SCNLine(nodeA: branch2.nodeB, nodeB: SCNVector3(-radius * rand1 * rand2,verticalOffset,1 * rand2), color: grey))
				e += 1
			}
			i += 1
		}
		
		return mesh
	}
	
	func harvest() -> SCNNode!
	{
		let mesh = SCNNode()
		let color:UIColor = cyan
		let sides:Int = 45
		let verticalOffset:Float = 12
		let radius:Float = 9
		
		var i = 0
		while i < sides {
			let root = SCNNode()
			root.eulerAngles.y = Float(degToRad(CGFloat(i * (360/sides))))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0.5,verticalOffset,radius), nodeB: SCNVector3(-0.5,verticalOffset,radius), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0,verticalOffset,radius), nodeB: SCNVector3(0,verticalOffset + 5,radius), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0.5,verticalOffset + 5,radius), nodeB: SCNVector3(-0.5,verticalOffset + 5,radius), color: color))
			mesh.addChildNode(root)
			i += 1
		}
		
		let aim = SCNNode()
		i = 0
		while i < 3
		{
			let test = SCNLine(nodeA: SCNVector3(0,verticalOffset,0.75), nodeB: SCNVector3(0,verticalOffset,0.95), color: white)
			test.eulerAngles.y = Float(degToRad(CGFloat(120 * i)))
			aim.addChildNode(test)
			i += 1
		}
		mesh.addChildNode(aim)
		
		return mesh
	}
	
	func star(color:UIColor = red) -> SCNNode
	{
		let mesh = SCNNode()
		var radius:Float = 2.75
		let distance:Float = 0
		
		var i = 0
		while i < 20 {
			radius -= 0.125
			
			mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius * 1.5,distance,0), nodeB: SCNVector3(radius,distance,-radius * 1.5), color: color))
			mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius * 1.5,distance,0), nodeB: SCNVector3(radius,distance,radius * 1.5), color: color))
			
			mesh.addChildNode(SCNLine(nodeA: SCNVector3(-radius * 1.5,distance,0), nodeB: SCNVector3(-radius,distance,-radius * 1.5), color: color))
			mesh.addChildNode(SCNLine(nodeA: SCNVector3(-radius * 1.5,distance,0), nodeB: SCNVector3(-radius,distance,radius * 1.5), color: color))
			
			mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius,distance,-radius * 1.5), nodeB: SCNVector3(-radius,distance,-radius * 1.5), color: color))
			mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius,distance,radius * 1.5), nodeB: SCNVector3(-radius,distance,radius * 1.5), color: color))
			
			i++
		}
		
		mesh.position = SCNVector3(0,4,0)
		
		return mesh
	}
	
	func portal(radius:Float = 5, sides:Int = 72, depth:Float = 0.5, color:UIColor = red) -> SCNNode
	{
		let mesh = SCNNode()
		let verticalOffset:Float = 8
		
		var i = 0
		while i < sides {
			let root = SCNNode()
			root.addChildNode(SCNLine(nodeA: SCNVector3(-radius,verticalOffset * 3,0), nodeB: SCNVector3(0,verticalOffset/2,radius), color: color))
			mesh.addChildNode(root)
			root.eulerAngles.y = Float(degToRad(CGFloat(i * (360/sides))))
			i += 1
		}
		
		return mesh
	}
	
	func trade(radius:Float = 1.5, tunnels:Int = (Int(arc4random_uniform(3)) * 6), depth:Float = 0, color:UIColor = red) -> SCNNode
	{
		let mesh = SCNNode()
		
		let offset = SCNNode()
		offset.position = SCNVector3(0,2.75,0)
		mesh.addChildNode(offset)
		
		var i = 0
		while i < tunnels {
			let root = SCNNode()
			
			root.addChildNode(SCNLine(nodeA: SCNVector3(-radius,depth * Float(i),0), nodeB: SCNVector3(0,depth * Float(i),radius), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0,depth * Float(i),radius), nodeB: SCNVector3(radius,depth * Float(i),0), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(radius,depth * Float(i),0), nodeB: SCNVector3(0,depth * Float(i) + 2,-radius), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0,depth * Float(i) + 2,-radius), nodeB: SCNVector3(-radius,depth * Float(i),0), color: color))
			
			root.eulerAngles.y = Float(degToRad(CGFloat(i * (360/tunnels))))
			
			offset.addChildNode(root)
			i += 1
		}
		
		return mesh
	}
	
	func horadric(radius:CGFloat = 5, color:UIColor = grey) -> SCNNode
	{
		let mesh = SCNNode()
		
		let cube1 = SCNCube(size: radius, color:color)
		mesh.addChildNode(cube1)
		cube1.line9.color(clear)
		cube1.line10.color(clear)
		cube1.line11.color(clear)
		cube1.line12.color(clear)
		
		let cube2 = SCNCube(size: radius, color:color)
		mesh.addChildNode(cube2)
		cube2.line9.color(clear)
		cube2.line10.color(clear)
		cube2.line11.color(clear)
		cube2.line12.color(clear)
		
		let cube3 = SCNCube(size: radius, color:color)
		mesh.addChildNode(cube3)
		cube3.line9.color(clear)
		cube3.line10.color(clear)
		cube3.line11.color(clear)
		cube3.line12.color(clear)
		
		let cube4 = SCNCube(size: radius, color:color)
		mesh.addChildNode(cube4)
		cube4.line9.color(clear)
		cube4.line10.color(clear)
		cube4.line11.color(clear)
		cube4.line12.color(clear)
		
		let cube5 = SCNCube(size: radius, color:color)
		mesh.addChildNode(cube5)
		cube5.line9.color(clear)
		cube5.line10.color(clear)
		cube5.line11.color(clear)
		cube5.line12.color(clear)
		
		let cube6 = SCNCube(size: radius, color:color)
		mesh.addChildNode(cube6)
		cube6.line9.color(clear)
		cube6.line10.color(clear)
		cube6.line11.color(clear)
		cube6.line12.color(clear)
		
		return mesh
	}
	
	func beacon() -> SCNNode
	{
		let mesh = SCNNode()
		let radius:Float = 4
		let color:UIColor = red
		let sides:Int = 8
		let verticalOffset:Float = 5
		
		var i = 0
		while i < sides {
			let root = SCNNode()
			
			let counter:Float = 0
			root.addChildNode(SCNLine(nodeA: SCNVector3(-radius,verticalOffset + counter,0), nodeB: SCNVector3(0,verticalOffset + counter,radius), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0,verticalOffset + counter,radius), nodeB: SCNVector3(radius,verticalOffset + counter,0), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(radius,verticalOffset + counter,0), nodeB: SCNVector3(0,verticalOffset + counter,-radius), color: color))
			root.addChildNode(SCNLine(nodeA: SCNVector3(0,verticalOffset + counter,-radius), nodeB: SCNVector3(-radius,verticalOffset + counter,0), color: color))
			
			let test = CGFloat(i * (360/sides/3))
			
			mesh.addChildNode(root)
			
			root.eulerAngles.y = Float(degToRad(test))
			i += 1
		}
		
		let aim = SCNNode()
		i = 0
		while i < 3
		{
			let test = SCNLine(nodeA: SCNVector3(0,verticalOffset/3,0.75), nodeB: SCNVector3(0,verticalOffset/3,0.85), color: white)
			test.eulerAngles.y = Float(degToRad(CGFloat(120 * i)))
			aim.addChildNode(test)
			i += 1
		}
		mesh.addChildNode(aim)
		
		return mesh
	}
	
	func station(color:UIColor = red) -> SCNNode
	{
		let mesh = SCNNode()
		return mesh
	}
	
	// MARK: Constellations -

	func c_fog(color:UIColor = grey) -> SCNNode
	{
		let mesh = SCNNode()
		let radius:Float = 3
		
		print("! Missing structure")
		
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(radius,0,0), nodeB: SCNVector3(-radius,0,0), color: color))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(0,radius,0), nodeB: SCNVector3(0,-radius,0), color: color))
		mesh.addChildNode(SCNLine(nodeA: SCNVector3(0,0,radius), nodeB: SCNVector3(0,0,-radius), color: color))
		
		return mesh
	}
	
	
	func c_tunnel(radius:Float = 1.5, color:UIColor = grey) -> SCNNode
	{
		let mesh = SCNNode()
		let color:UIColor = cyan
		let sides:Int = 6
		let verticalOffset:Float = 18
		let radius:Float = 10
		
		var i = 0
		while i < sides {
			
			var e = 0
			while e < sides {
				let root = SCNNode()
				let vert = (verticalOffset * Float(i) * 0.1)+verticalOffset
				root.eulerAngles.y = Float(degToRad(CGFloat(Float(e) * Float(360/sides))))
				root.addChildNode(SCNLine(nodeA: SCNVector3(radius/1.75,vert,radius), nodeB: SCNVector3(-radius/1.75,vert,radius), color: color))
				mesh.addChildNode(root)
				e += 1
			}
			i += 1
		}
		
		return mesh
	}
}