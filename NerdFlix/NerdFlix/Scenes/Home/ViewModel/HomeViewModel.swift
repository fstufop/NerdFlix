//
//  HomeViewModel.swift
//  NerdFlix
//
//  Created by BootCamp on 25/09/21.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    var popularMovies: [MovieItemModel] = []
    var top250Movies: [MovieItemModel] = []
    var commingSoon: [MovieItemModel] = []
    
    var updateLayout: (() -> Void)?
    var shoulShowErrorMessage: ((String) -> Void)?
    
    var updateLayout2: (() -> Void)?
    var shoulShowErrorMessage2: ((String) -> Void)?
    
    var updateLayout3: (() -> Void)?
    var shoulShowErrorMessage3: ((String) -> Void)?
    
    func getMoviesQuantity () -> Int {
        popularMovies.count
    }
    
    func getMovieAt (_ index: Int) -> MovieItemModel {
        return popularMovies[index]
        
    }
    
    

   func getPopularMovies() {
        AF.request("https://imdb-api.com/en/API/MostPopularMovies/k_4dite83d", method: .get).responseJSON { (response) in
            
            guard let data = response.data else {return}
            
            do {
                let moviesModel = try JSONDecoder().decode(MoviesModel.self, from: data)
                self.popularMovies = moviesModel.items ?? []
                self.updateLayout?()
                print("======> Responses" ,response)
            } catch (let error) {
                self.shoulShowErrorMessage?(error.localizedDescription )

            }
        }
    }
    func getTop250Films() {
         AF.request("https://imdb-api.com/en/API/Top250Movies/k_4dite83d", method: .get).responseJSON { (response) in
             
             guard let data = response.data else {return}
             
             do {
                 let moviesModel = try JSONDecoder().decode(MoviesModel.self, from: data)
                 self.top250Movies = moviesModel.items ?? []
                 self.updateLayout2?()
                 print("======> Responses1" ,response)
             } catch (let error) {
                 self.shoulShowErrorMessage2?(error.localizedDescription )
                 
                 
                 
             }
         }
     }
    func getCommingSoon() {
         AF.request("https://imdb-api.com/en/API/ComingSoon/k_4dite83d", method: .get).responseJSON { (response) in
             
             guard let data = response.data else {return}
             
             do {
                 let moviesModel = try JSONDecoder().decode(MoviesModel.self, from: data)
                 self.commingSoon = moviesModel.items ?? []
                 self.updateLayout3?()
                 print("======> Responses3" ,response)
             } catch (let error) {
                 self.shoulShowErrorMessage3?(error.localizedDescription )
                 
                 
                 
             }
         }
     }
}
