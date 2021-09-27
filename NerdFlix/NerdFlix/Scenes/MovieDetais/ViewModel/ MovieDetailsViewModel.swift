//
//  MovieDetailsViewModel.swift
//  NerdFlix
//
//  Created by BootCamp on 26/09/21.
//

import Foundation
import Alamofire

class MovieDetailsViewModel {
    
    func getMovieDetails(_ id: String) {
        AF.request("https://imdb-api.com/en/API/MostPopularMovies/k_7r0tl026/\(id)", method: .get).responseJSON { (response) in
            
            print("======> Responses" ,response)
        }
    }
}

