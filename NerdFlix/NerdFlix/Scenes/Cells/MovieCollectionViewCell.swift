//
//  MovieCollectionViewCell.swift
//  NerdFlix
//
//  Created by BootCamp on 25/09/21.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    static let reuseIdentifier: String = "MovieCollectionViewCell"
    
    //MARK: - Outlets
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelMovieTitle: UILabel!
    //MARK: - Actions
    
    //MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    //MARK: - Methods
    func setupUI() {
        imageMovie.layer.cornerRadius = 20
        
    }
    func setupModel(_ movie: MovieItemModel?) {
        guard let movieModel = movie else {return}
        labelMovieTitle.text = movieModel.title
        guard let urlImage = movie?.image else { return }
        if let url = URL(string: urlImage) {
            imageMovie.kf.setImage(with: url)
            
        }
        
    }
    
    
}
//MARK: - Extensions
