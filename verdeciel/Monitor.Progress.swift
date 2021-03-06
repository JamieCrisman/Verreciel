
//  Created by Devine Lu Linvega on 2015-07-07.
//  Copyright (c) 2015 XXIIVV. All rights reserved.

import UIKit
import QuartzCore
import SceneKit
import Foundation

class MonitorProgress : Monitor
{
	override init()
	{
		super.init()
		name = "progress"
		self.eulerAngles.x = Float(degToRad(templates.monitorsAngle))
		
		label.update("--")
		details.update(name!)
	}
	
	override func start()
	{
		super.start()
		
	}
	
	override func refresh()
	{
		var totalQuestLocations = 0
		var totalQuestLocations_complete = 0
		
		for location in universe.childNodes {
			let location = location as! Location
			if location.isComplete != nil {
				totalQuestLocations += 1
				if location.isComplete == true { totalQuestLocations_complete += 1}
			}
		}
		
		label.update("\(totalQuestLocations_complete)/\(totalQuestLocations)")
	}
	
	override func onInstallationBegin()
	{
//		player.lookAt(deg: -270)
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}
}