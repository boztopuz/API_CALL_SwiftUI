//
//  MockAPIModel.swift
//  APICall
//
//  Created by Burak Öztopuz on 4.06.2023.
//

import Foundation

struct ModelElement: Hashable, Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
