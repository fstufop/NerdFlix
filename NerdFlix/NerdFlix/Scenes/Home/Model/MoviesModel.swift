//
//  MoviesModel.swift
//  NerdFlix
//
//  Created by BootCamp on 25/09/21.
//

import Foundation

struct MoviesModel: Codable {
    
    let items: [ MovieItemModel ]?
}

struct MovieItemModel: Codable {
    let title: String?
    let image: String?
    let id: String?
}
