//
//  MovieCollectionViewCell.swift
//  NerdFlix
//
//  Created by BootCamp on 25/09/21.
//

import UIKit

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

    }
    //MARK: - Methods
}
    //MARK: - Extensions
