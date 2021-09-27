//
//  MovieDetailsModel.swift
//  NerdFlix
//
//  Created by BootCamp on 26/09/21.
//

import Foundation

struct MoviesDetailsModel: Codable {
    
    let items: [DetailsItemModel]?
}

struct DetailsItemModel: Codable {
    let title: String?
    let image: String?
    let id: String?
}
