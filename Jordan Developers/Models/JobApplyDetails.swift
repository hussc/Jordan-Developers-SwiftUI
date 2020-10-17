//
//  JobApplyDetails.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/17/20.
//

import Foundation

struct JobApplyDetails {
    enum ApplyType: String, Codable {
        case redirect
        case email
    }
    
    let type: ApplyType
    let url: String
}

extension JobApplyDetails: Codable { }
