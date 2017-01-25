//
//  FWAvailableModules.swift
//
//  Created by indianic on 04/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWAvailableModules: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWAvailableModulesClassIDKey: String = "classID"
	internal let kFWAvailableModulesIconURLKey: String = "iconURL"
	internal let kFWAvailableModulesInternalIdentifierKey: String = "id"
	internal let kFWAvailableModulesOrderKey: String = "order"
	internal let kFWAvailableModulesScreensKey: String = "screens"
	internal let kFWAvailableModulesCaptionKey: String = "caption"


    // MARK: Properties
	public var classID: String?
	public var iconURL: String?
	public var internalIdentifier: String?
	public var order: Int?
	public var screens: [FWScreens]?
	public var caption: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		classID = json[kFWAvailableModulesClassIDKey].string
		iconURL = json[kFWAvailableModulesIconURLKey].string
		internalIdentifier = json[kFWAvailableModulesInternalIdentifierKey].string
		order = json[kFWAvailableModulesOrderKey].int
		screens = []
		if let items = json[kFWAvailableModulesScreensKey].array {
			for item in items {
				screens?.append(FWScreens(json: item))
			}
		} else {
			screens = nil
		}
		caption = json[kFWAvailableModulesCaptionKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if classID != nil {
			dictionary.updateValue(classID!, forKey: kFWAvailableModulesClassIDKey)
		}
		if iconURL != nil {
			dictionary.updateValue(iconURL!, forKey: kFWAvailableModulesIconURLKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kFWAvailableModulesInternalIdentifierKey)
		}
		if order != nil {
			dictionary.updateValue(order!, forKey: kFWAvailableModulesOrderKey)
		}
		if screens?.count > 0 {
			var temp: [AnyObject] = []
			for item in screens! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kFWAvailableModulesScreensKey)
		}
		if caption != nil {
			dictionary.updateValue(caption!, forKey: kFWAvailableModulesCaptionKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.classID = aDecoder.decodeObjectForKey(kFWAvailableModulesClassIDKey) as? String
		self.iconURL = aDecoder.decodeObjectForKey(kFWAvailableModulesIconURLKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kFWAvailableModulesInternalIdentifierKey) as? String
		self.order = aDecoder.decodeObjectForKey(kFWAvailableModulesOrderKey) as? Int
		self.screens = aDecoder.decodeObjectForKey(kFWAvailableModulesScreensKey) as? [FWScreens]
		self.caption = aDecoder.decodeObjectForKey(kFWAvailableModulesCaptionKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(classID, forKey: kFWAvailableModulesClassIDKey)
		aCoder.encodeObject(iconURL, forKey: kFWAvailableModulesIconURLKey)
		aCoder.encodeObject(internalIdentifier, forKey: kFWAvailableModulesInternalIdentifierKey)
		aCoder.encodeObject(order, forKey: kFWAvailableModulesOrderKey)
		aCoder.encodeObject(screens, forKey: kFWAvailableModulesScreensKey)
		aCoder.encodeObject(caption, forKey: kFWAvailableModulesCaptionKey)

    }

}
