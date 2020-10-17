//
//  Company.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/16/20.
//

import Foundation

struct Company {
    let name: String
    let logo_url: URL?
}

extension Company: Codable {}
