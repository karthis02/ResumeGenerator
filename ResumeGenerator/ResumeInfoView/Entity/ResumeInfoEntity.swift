//
//  ResumeInfoEntity.swift
//  ResumeGenerator
//
//  Created by Mac_Admin on 15/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import UIKit

//Resume Info Codable model/entity.
struct ResumeInfo:Codable {
    var firstName = ""
    var lastName = ""
    var emailId = ""
    var mobileNumber = ""
    var addressLine1 = ""
    var addressLine2 = ""
    var dob = ""
    var currentCompany = ""
    var yearOfExp = ""
    var skillSet = ""
    var primaryEducationMarks = ""
    var secondaryEducationMarks = ""
    var higherEducationMarks = ""
    
}
