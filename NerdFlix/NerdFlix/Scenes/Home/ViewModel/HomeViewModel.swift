//
//  HomeViewModel.swift
//  NerdFlix
//
//  Created by BootCamp on 25/09/21.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    private var movies: [MovieItemModel] = []
    
    var updateLayout: (() -> Void)?
    var shoulShowErrorMessage: ((String) -> Void)?
    
    func getMoviesQuantity () -> Int {
        movies.count
    }
    func getMovieAt (_ index: Int) -> MovieItemModel {
        return movies[index]
        
    }
  
    
   func getPopularMovies() {
        AF.request("https://imdb-api.com/en/API/MostPopularMovies/k_3g4a43n5", method: .get).responseJSON { (response) in
            
            guard let data = response.data else {return}
            
            do {
                let moviesModel = try JSONDecoder().decode(MoviesModel.self, from: data)
                self.movies = moviesModel.items ?? []
                self.updateLayout?()
                print("======> Responses" ,response)
            } catch (let error) {
                self.shoulShowErrorMessage?(error.localizedDescription )
                
                
                
            }
        }
    }
}
