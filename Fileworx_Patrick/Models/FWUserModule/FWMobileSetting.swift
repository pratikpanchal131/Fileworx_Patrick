//
//  FWMobileSetting.swift
//
//  Created by  on 25/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class FWMobileSetting: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFWMobileSettingDataKey: String = "data"
	internal let kFWMobileSettingMessageKey: String = "message"
	internal let kFWMobileSettingResultKey: String = "result"


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
		data = FWData(json: json[kFWMobileSettingDataKey])
		message = json[kFWMobileSettingMessageKey].string
		result = json[kFWMobileSettingResultKey].int

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data != nil {
			dictionary.updateValue(data!.dictionaryRepresentation() as AnyObject, forKey: kFWMobileSettingDataKey)
		}
		if message != nil {
			dictionary.updateValue(message! as AnyObject, forKey: kFWMobileSettingMessageKey)
		}
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kFWMobileSettingResultKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.data = aDecoder.decodeObject(forKey: kFWMobileSettingDataKey) as? FWData
		self.message = aDecoder.decodeObject(forKey: kFWMobileSettingMessageKey) as? String
		self.result = aDecoder.decodeObject(forKey: kFWMobileSettingResultKey) as? Int

    }

    public func encode(with aCoder: NSCoder) {
		aCoder.encode(data, forKey: kFWMobileSettingDataKey)
		aCoder.encode(message, forKey: kFWMobileSettingMessageKey)
		aCoder.encode(result, forKey: kFWMobileSettingResultKey)

    }
    


}
