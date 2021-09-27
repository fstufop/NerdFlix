//
//  DetailsViewController.swift
//  NerdFlix
//
//  Created by BootCamp on 26/09/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    //MARK: - Properties
    private var viewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    private var movieId: String = " "
    
    init(_ id: String) {
        self.movieId = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Outlets
    @IBOutlet weak var imageViewMovie: UIImageView!
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelActorsName: UILabel!
    
    //MARK: - Actions
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        viewModel.getMovieDetails(movieId)
    }

    //MARK: - Methods
    
    //MARK: - Extensions
   
}
