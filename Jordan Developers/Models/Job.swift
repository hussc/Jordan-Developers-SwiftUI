//
//  Job.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import Foundation

struct Job: Identifiable {
    let id: Int
    let title: String
    let company: Company
    let publishedAt: String
    let tags: [String]
    
    
    var isFavorited: Bool = false
    
    /**
     A Description only loaded when requesting job details, not available at job listings
     */
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case company
        case publishedAt = "published_at"
        case tags
        case description
    }
}


extension Job: Codable {}

extension Job {
    static func sample() -> Job {
        Job(id: -1,
            title: "Backend Developer",
            company: .init(name: "Uber", logo_url: URL(string: "")),
            publishedAt: "20/9/2020",
            tags: ["Backend", "Uber"],
            description: nil)
    }
}
