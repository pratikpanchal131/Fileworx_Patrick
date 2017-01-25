//
//  FWUserModule.swift
//
//  Created by indianic on 04/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWUserModule: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWUserModuleDataKey: String = "data"
	internal let kFWUserModuleMessageKey: String = "message"
	internal let kFWUserModuleResultKey: String = "result"


    // MARK: Properties
	public var data: FWData?
	public var message: String?
	public var result: Int?


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
		data = FWData(json: json[kFWUserModuleDataKey])
		message = json[kFWUserModuleMessageKey].string
		result = json[kFWUserModuleResultKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data != nil {
			dictionary.updateValue(data!.dictionaryRepresentation(), forKey: kFWUserModuleDataKey)
		}
		if message != nil {
			dictionary.updateValue(message!, forKey: kFWUserModuleMessageKey)
		}
		if result != nil {
			dictionary.updateValue(result!, forKey: kFWUserModuleResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.data = aDecoder.decodeObjectForKey(kFWUserModuleDataKey) as? FWData
		self.message = aDecoder.decodeObjectForKey(kFWUserModuleMessageKey) as? String
		self.result = aDecoder.decodeObjectForKey(kFWUserModuleResultKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(data, forKey: kFWUserModuleDataKey)
		aCoder.encodeObject(message, forKey: kFWUserModuleMessageKey)
		aCoder.encodeObject(result, forKey: kFWUserModuleResultKey)

    }

}
