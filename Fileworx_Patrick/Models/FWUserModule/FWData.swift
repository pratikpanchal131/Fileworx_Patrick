//
//  FWData.swift
//
//  Created by indianic on 04/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWData: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWDataHomeScreenIDKey: String = "homeScreenID"
	internal let kFWDataPasswordKey: String = "password"
	internal let kFWDataLastLoginLanguageIDKey: String = "lastLoginLanguageID"
	internal let kFWDataUserHostNameKey: String = "userHostName"
	internal let kFWDataUserPreferredLanguageIDKey: String = "userPreferredLanguageID"
	internal let kFWDataAvailableModulesKey: String = "availableModules"
	internal let kFWDataUserNameKey: String = "userName"
	internal let kFWDataUtKey: String = "ut"


    // MARK: Properties
	public var homeScreenID: String?
	public var password: String?
	public var lastLoginLanguageID: Int?
	public var userHostName: String?
	public var userPreferredLanguageID: Int?
	public var availableModules: [FWAvailableModules]?
	public var userName: String?
	public var ut: String?


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
		homeScreenID = json[kFWDataHomeScreenIDKey].string
		password = json[kFWDataPasswordKey].string
		lastLoginLanguageID = json[kFWDataLastLoginLanguageIDKey].int
		userHostName = json[kFWDataUserHostNameKey].string
		userPreferredLanguageID = json[kFWDataUserPreferredLanguageIDKey].int
		availableModules = []
		if let items = json[kFWDataAvailableModulesKey].array {
			for item in items {
				availableModules?.append(FWAvailableModules(json: item))
			}
		} else {
			availableModules = nil
		}
		userName = json[kFWDataUserNameKey].string
		ut = json[kFWDataUtKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if homeScreenID != nil {
			dictionary.updateValue(homeScreenID!, forKey: kFWDataHomeScreenIDKey)
		}
		if password != nil {
			dictionary.updateValue(password!, forKey: kFWDataPasswordKey)
		}
		if lastLoginLanguageID != nil {
			dictionary.updateValue(lastLoginLanguageID!, forKey: kFWDataLastLoginLanguageIDKey)
		}
		if userHostName != nil {
			dictionary.updateValue(userHostName!, forKey: kFWDataUserHostNameKey)
		}
		if userPreferredLanguageID != nil {
			dictionary.updateValue(userPreferredLanguageID!, forKey: kFWDataUserPreferredLanguageIDKey)
		}
		if availableModules?.count > 0 {
			var temp: [AnyObject] = []
			for item in availableModules! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kFWDataAvailableModulesKey)
		}
		if userName != nil {
			dictionary.updateValue(userName!, forKey: kFWDataUserNameKey)
		}
		if ut != nil {
			dictionary.updateValue(ut!, forKey: kFWDataUtKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.homeScreenID = aDecoder.decodeObjectForKey(kFWDataHomeScreenIDKey) as? String
		self.password = aDecoder.decodeObjectForKey(kFWDataPasswordKey) as? String
		self.lastLoginLanguageID = aDecoder.decodeObjectForKey(kFWDataLastLoginLanguageIDKey) as? Int
		self.userHostName = aDecoder.decodeObjectForKey(kFWDataUserHostNameKey) as? String
		self.userPreferredLanguageID = aDecoder.decodeObjectForKey(kFWDataUserPreferredLanguageIDKey) as? Int
		self.availableModules = aDecoder.decodeObjectForKey(kFWDataAvailableModulesKey) as? [FWAvailableModules]
		self.userName = aDecoder.decodeObjectForKey(kFWDataUserNameKey) as? String
		self.ut = aDecoder.decodeObjectForKey(kFWDataUtKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(homeScreenID, forKey: kFWDataHomeScreenIDKey)
		aCoder.encodeObject(password, forKey: kFWDataPasswordKey)
		aCoder.encodeObject(lastLoginLanguageID, forKey: kFWDataLastLoginLanguageIDKey)
		aCoder.encodeObject(userHostName, forKey: kFWDataUserHostNameKey)
		aCoder.encodeObject(userPreferredLanguageID, forKey: kFWDataUserPreferredLanguageIDKey)
		aCoder.encodeObject(availableModules, forKey: kFWDataAvailableModulesKey)
		aCoder.encodeObject(userName, forKey: kFWDataUserNameKey)
		aCoder.encodeObject(ut, forKey: kFWDataUtKey)

    }

}
