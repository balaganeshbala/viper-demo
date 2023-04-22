//
//  PostModel.swift
//  VIPERDemo
//
//  Created by Balaganesh on 20/04/23.
//

import Foundation

struct PostModel: Decodable {
    let id: Int
    let title: String
    let body: String
}

struct Posts: Decodable {
    let posts: [PostModel]
}

struct PostCell {
    let title: String
}
