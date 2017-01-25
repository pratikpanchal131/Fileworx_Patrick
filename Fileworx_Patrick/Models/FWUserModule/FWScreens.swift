//
//  FWScreens.swift
//
//  Created by indianic on 04/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWScreens: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWScreensTargetObjectClassIDKey: String = "targetObjectClassID"
	internal let kFWScreensMobileIconURLKey: String = "mobileIconURL"
	internal let kFWScreensModuleIDKey: String = "moduleID"
	internal let kFWScreensContentTasksListKey: String = "contentTasksList"
	internal let kFWScreensIsDocumentsScreenKey: String = "isDocumentsScreen"
	internal let kFWScreensIconURLKey: String = "iconURL"
	internal let kFWScreensInternalIdentifierKey: String = "id"
	internal let kFWScreensOrderInModuleKey: String = "orderInModule"
	internal let kFWScreensTargetActionTypeKey: String = "targetActionType"
	internal let kFWScreensCaptionKey: String = "caption"
	internal let kFWScreensClassIDKey: String = "classID"
	internal let kFWScreensTargetObjectTypeKey: String = "targetObjectType"
	internal let kFWScreensTargetNameKey: String = "targetName"
	internal let kFWScreensTargetObjectIDKey: String = "targetObjectID"
	internal let kFWScreensTargetObjectNameKey: String = "targetObjectName"


    // MARK: Properties
	public var targetObjectClassID: String?
	public var mobileIconURL: String?
	public var moduleID: String?
	public var contentTasksList: [FWContentTasksList]?
	public var isDocumentsScreen: Bool = false
	public var iconURL: String?
	public var internalIdentifier: String?
	public var orderInModule: Int?
	public var targetActionType: Int?
	public var caption: String?
	public var classID: String?
	public var targetObjectType: Int?
	public var targetName: String?
	public var targetObjectID: String?
	public var targetObjectName: String?


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
		targetObjectClassID = json[kFWScreensTargetObjectClassIDKey].string
		mobileIconURL = json[kFWScreensMobileIconURLKey].string
		moduleID = json[kFWScreensModuleIDKey].string
		contentTasksList = []
		if let items = json[kFWScreensContentTasksListKey].array {
			for item in items {
				contentTasksList?.append(FWContentTasksList(json: item))
			}
		} else {
			contentTasksList = nil
		}
		isDocumentsScreen = json[kFWScreensIsDocumentsScreenKey].boolValue
		iconURL = json[kFWScreensIconURLKey].string
		internalIdentifier = json[kFWScreensInternalIdentifierKey].string
		orderInModule = json[kFWScreensOrderInModuleKey].int
		targetActionType = json[kFWScreensTargetActionTypeKey].int
		caption = json[kFWScreensCaptionKey].string
		classID = json[kFWScreensClassIDKey].string
		targetObjectType = json[kFWScreensTargetObjectTypeKey].int
		targetName = json[kFWScreensTargetNameKey].string
		targetObjectID = json[kFWScreensTargetObjectIDKey].string
		targetObjectName = json[kFWScreensTargetObjectNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if targetObjectClassID != nil {
			dictionary.updateValue(targetObjectClassID!, forKey: kFWScreensTargetObjectClassIDKey)
		}
		if mobileIconURL != nil {
			dictionary.updateValue(mobileIconURL!, forKey: kFWScreensMobileIconURLKey)
		}
		if moduleID != nil {
			dictionary.updateValue(moduleID!, forKey: kFWScreensModuleIDKey)
		}
		if contentTasksList?.count > 0 {
			var temp: [AnyObject] = []
			for item in contentTasksList! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kFWScreensContentTasksListKey)
		}
		dictionary.updateValue(isDocumentsScreen, forKey: kFWScreensIsDocumentsScreenKey)
		if iconURL != nil {
			dictionary.updateValue(iconURL!, forKey: kFWScreensIconURLKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kFWScreensInternalIdentifierKey)
		}
		if orderInModule != nil {
			dictionary.updateValue(orderInModule!, forKey: kFWScreensOrderInModuleKey)
		}
		if targetActionType != nil {
			dictionary.updateValue(targetActionType!, forKey: kFWScreensTargetActionTypeKey)
		}
		if caption != nil {
			dictionary.updateValue(caption!, forKey: kFWScreensCaptionKey)
		}
		if classID != nil {
			dictionary.updateValue(classID!, forKey: kFWScreensClassIDKey)
		}
		if targetObjectType != nil {
			dictionary.updateValue(targetObjectType!, forKey: kFWScreensTargetObjectTypeKey)
		}
		if targetName != nil {
			dictionary.updateValue(targetName!, forKey: kFWScreensTargetNameKey)
		}
		if targetObjectID != nil {
			dictionary.updateValue(targetObjectID!, forKey: kFWScreensTargetObjectIDKey)
		}
		if targetObjectName != nil {
			dictionary.updateValue(targetObjectName!, forKey: kFWScreensTargetObjectNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.targetObjectClassID = aDecoder.decodeObjectForKey(kFWScreensTargetObjectClassIDKey) as? String
		self.mobileIconURL = aDecoder.decodeObjectForKey(kFWScreensMobileIconURLKey) as? String
		self.moduleID = aDecoder.decodeObjectForKey(kFWScreensModuleIDKey) as? String
		self.contentTasksList = aDecoder.decodeObjectForKey(kFWScreensContentTasksListKey) as? [FWContentTasksList]
		self.isDocumentsScreen = aDecoder.decodeBoolForKey(kFWScreensIsDocumentsScreenKey)
		self.iconURL = aDecoder.decodeObjectForKey(kFWScreensIconURLKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kFWScreensInternalIdentifierKey) as? String
		self.orderInModule = aDecoder.decodeObjectForKey(kFWScreensOrderInModuleKey) as? Int
		self.targetActionType = aDecoder.decodeObjectForKey(kFWScreensTargetActionTypeKey) as? Int
		self.caption = aDecoder.decodeObjectForKey(kFWScreensCaptionKey) as? String
		self.classID = aDecoder.decodeObjectForKey(kFWScreensClassIDKey) as? String
		self.targetObjectType = aDecoder.decodeObjectForKey(kFWScreensTargetObjectTypeKey) as? Int
		self.targetName = aDecoder.decodeObjectForKey(kFWScreensTargetNameKey) as? String
		self.targetObjectID = aDecoder.decodeObjectForKey(kFWScreensTargetObjectIDKey) as? String
		self.targetObjectName = aDecoder.decodeObjectForKey(kFWScreensTargetObjectNameKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(targetObjectClassID, forKey: kFWScreensTargetObjectClassIDKey)
		aCoder.encodeObject(mobileIconURL, forKey: kFWScreensMobileIconURLKey)
		aCoder.encodeObject(moduleID, forKey: kFWScreensModuleIDKey)
		aCoder.encodeObject(contentTasksList, forKey: kFWScreensContentTasksListKey)
		aCoder.encodeBool(isDocumentsScreen, forKey: kFWScreensIsDocumentsScreenKey)
		aCoder.encodeObject(iconURL, forKey: kFWScreensIconURLKey)
		aCoder.encodeObject(internalIdentifier, forKey: kFWScreensInternalIdentifierKey)
		aCoder.encodeObject(orderInModule, forKey: kFWScreensOrderInModuleKey)
		aCoder.encodeObject(targetActionType, forKey: kFWScreensTargetActionTypeKey)
		aCoder.encodeObject(caption, forKey: kFWScreensCaptionKey)
		aCoder.encodeObject(classID, forKey: kFWScreensClassIDKey)
		aCoder.encodeObject(targetObjectType, forKey: kFWScreensTargetObjectTypeKey)
		aCoder.encodeObject(targetName, forKey: kFWScreensTargetNameKey)
		aCoder.encodeObject(targetObjectID, forKey: kFWScreensTargetObjectIDKey)
		aCoder.encodeObject(targetObjectName, forKey: kFWScreensTargetObjectNameKey)

    }

}
