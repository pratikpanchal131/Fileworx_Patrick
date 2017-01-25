//
//  FWContentTasksList.swift
//
//  Created by indianic on 04/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWContentTasksList: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWContentTasksListScreenIDKey: String = "screenID"
	internal let kFWContentTasksListConfirmationMessageKey: String = "confirmationMessage"
	internal let kFWContentTasksListModuleIDKey: String = "moduleID"
	internal let kFWContentTasksListBeforeSubmitFormIDKey: String = "beforeSubmitFormID"
	internal let kFWContentTasksListIsSendTaskKey: String = "isSendTask"
	internal let kFWContentTasksListTargetActionNameKey: String = "targetActionName"
	internal let kFWContentTasksListClassIdKey: String = "classId"
	internal let kFWContentTasksListNeedsConfirmationKey: String = "needsConfirmation"
	internal let kFWContentTasksListInternalIdentifierKey: String = "id"
	internal let kFWContentTasksListCaptionKey: String = "caption"
	internal let kFWContentTasksListHasDefaultInputFormKey: String = "hasDefaultInputForm"
	internal let kFWContentTasksListTaskOpenLocationKey: String = "taskOpenLocation"
	internal let kFWContentTasksListTargetActionIDKey: String = "targetActionID"


    // MARK: Properties
	public var screenID: String?
	public var confirmationMessage: String?
	public var moduleID: String?
	public var beforeSubmitFormID: String?
	public var isSendTask: Bool = false
	public var targetActionName: String?
	public var classId: FWClassId?
	public var needsConfirmation: Bool = false
	public var internalIdentifier: String?
	public var caption: String?
	public var hasDefaultInputForm: Bool = false
	public var taskOpenLocation: String?
	public var targetActionID: String?


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
		screenID = json[kFWContentTasksListScreenIDKey].string
		confirmationMessage = json[kFWContentTasksListConfirmationMessageKey].string
		moduleID = json[kFWContentTasksListModuleIDKey].string
		beforeSubmitFormID = json[kFWContentTasksListBeforeSubmitFormIDKey].string
		isSendTask = json[kFWContentTasksListIsSendTaskKey].boolValue
		targetActionName = json[kFWContentTasksListTargetActionNameKey].string
		classId = FWClassId(json: json[kFWContentTasksListClassIdKey])
		needsConfirmation = json[kFWContentTasksListNeedsConfirmationKey].boolValue
		internalIdentifier = json[kFWContentTasksListInternalIdentifierKey].string
		caption = json[kFWContentTasksListCaptionKey].string
		hasDefaultInputForm = json[kFWContentTasksListHasDefaultInputFormKey].boolValue
		taskOpenLocation = json[kFWContentTasksListTaskOpenLocationKey].string
		targetActionID = json[kFWContentTasksListTargetActionIDKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if screenID != nil {
			dictionary.updateValue(screenID!, forKey: kFWContentTasksListScreenIDKey)
		}
		if confirmationMessage != nil {
			dictionary.updateValue(confirmationMessage!, forKey: kFWContentTasksListConfirmationMessageKey)
		}
		if moduleID != nil {
			dictionary.updateValue(moduleID!, forKey: kFWContentTasksListModuleIDKey)
		}
		if beforeSubmitFormID != nil {
			dictionary.updateValue(beforeSubmitFormID!, forKey: kFWContentTasksListBeforeSubmitFormIDKey)
		}
		dictionary.updateValue(isSendTask, forKey: kFWContentTasksListIsSendTaskKey)
		if targetActionName != nil {
			dictionary.updateValue(targetActionName!, forKey: kFWContentTasksListTargetActionNameKey)
		}
		if classId != nil {
			dictionary.updateValue(classId!.dictionaryRepresentation(), forKey: kFWContentTasksListClassIdKey)
		}
		dictionary.updateValue(needsConfirmation, forKey: kFWContentTasksListNeedsConfirmationKey)
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kFWContentTasksListInternalIdentifierKey)
		}
		if caption != nil {
			dictionary.updateValue(caption!, forKey: kFWContentTasksListCaptionKey)
		}
		dictionary.updateValue(hasDefaultInputForm, forKey: kFWContentTasksListHasDefaultInputFormKey)
		if taskOpenLocation != nil {
			dictionary.updateValue(taskOpenLocation!, forKey: kFWContentTasksListTaskOpenLocationKey)
		}
		if targetActionID != nil {
			dictionary.updateValue(targetActionID!, forKey: kFWContentTasksListTargetActionIDKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.screenID = aDecoder.decodeObjectForKey(kFWContentTasksListScreenIDKey) as? String
		self.confirmationMessage = aDecoder.decodeObjectForKey(kFWContentTasksListConfirmationMessageKey) as? String
		self.moduleID = aDecoder.decodeObjectForKey(kFWContentTasksListModuleIDKey) as? String
		self.beforeSubmitFormID = aDecoder.decodeObjectForKey(kFWContentTasksListBeforeSubmitFormIDKey) as? String
		self.isSendTask = aDecoder.decodeBoolForKey(kFWContentTasksListIsSendTaskKey)
		self.targetActionName = aDecoder.decodeObjectForKey(kFWContentTasksListTargetActionNameKey) as? String
		self.classId = aDecoder.decodeObjectForKey(kFWContentTasksListClassIdKey) as? FWClassId
		self.needsConfirmation = aDecoder.decodeBoolForKey(kFWContentTasksListNeedsConfirmationKey)
		self.internalIdentifier = aDecoder.decodeObjectForKey(kFWContentTasksListInternalIdentifierKey) as? String
		self.caption = aDecoder.decodeObjectForKey(kFWContentTasksListCaptionKey) as? String
		self.hasDefaultInputForm = aDecoder.decodeBoolForKey(kFWContentTasksListHasDefaultInputFormKey)
		self.taskOpenLocation = aDecoder.decodeObjectForKey(kFWContentTasksListTaskOpenLocationKey) as? String
		self.targetActionID = aDecoder.decodeObjectForKey(kFWContentTasksListTargetActionIDKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(screenID, forKey: kFWContentTasksListScreenIDKey)
		aCoder.encodeObject(confirmationMessage, forKey: kFWContentTasksListConfirmationMessageKey)
		aCoder.encodeObject(moduleID, forKey: kFWContentTasksListModuleIDKey)
		aCoder.encodeObject(beforeSubmitFormID, forKey: kFWContentTasksListBeforeSubmitFormIDKey)
		aCoder.encodeBool(isSendTask, forKey: kFWContentTasksListIsSendTaskKey)
		aCoder.encodeObject(targetActionName, forKey: kFWContentTasksListTargetActionNameKey)
		aCoder.encodeObject(classId, forKey: kFWContentTasksListClassIdKey)
		aCoder.encodeBool(needsConfirmation, forKey: kFWContentTasksListNeedsConfirmationKey)
		aCoder.encodeObject(internalIdentifier, forKey: kFWContentTasksListInternalIdentifierKey)
		aCoder.encodeObject(caption, forKey: kFWContentTasksListCaptionKey)
		aCoder.encodeBool(hasDefaultInputForm, forKey: kFWContentTasksListHasDefaultInputFormKey)
		aCoder.encodeObject(taskOpenLocation, forKey: kFWContentTasksListTaskOpenLocationKey)
		aCoder.encodeObject(targetActionID, forKey: kFWContentTasksListTargetActionIDKey)

    }

}
