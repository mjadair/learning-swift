//
//  constants.swift
//  Flash Chat iOS13
//
//  Created by Michael Adair on 12/08/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegistrationSuccessful"
    static let loginSegue =  "LoginUser"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
