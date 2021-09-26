//
//  HomeViewController.swift
//  NerdFlix
//
//  Created by BootCamp on 24/09/21.
//

import UIKit
import AVFoundation
import Kingfisher


class HomeViewController: UIViewController {
    
    
    
    //MARK: - Properties
    var player = AVAudioPlayer()
    let url = URL(string: "https://m.media-amazon.com/images/M/MV5BN2IyYzI4YmQtNzBmMi00Mjg3LWI4NTMtNmZjNjk3YjIwZmJhXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX128_CR0,3,128,176_AL_.jpg")
   
    private var viewModel: HomeViewModel = HomeViewModel()
    private var movieCollectionModel: MovieCollectionViewCell = MovieCollectionViewCell()
    //MARK: - Outlets
    @IBOutlet weak var collectionViewForYou: UICollectionView!
    @IBOutlet weak var imageViewNewMovie: UIImageView!
    @IBOutlet weak var labelNewMovieName: UILabel!
    @IBOutlet weak var labelActorsNewMovie: UILabel!
    //MARK: - Actions
   
    
    //MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tudumPlayer()
        player.play()
        setupNavigation()
        setupCollections()
        setupUI()
        bindEvents()
        viewModel.getPopularMovies()
        title = "NerdFlix"
    }
    //MARK: - Methods
    func tudumPlayer(){
        do{
            let path = Bundle.main.path(forResource: "Netflix", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        }
        catch{
            print(error)
        }
    }
    func setupUI(){
        imageViewNewMovie.kf.setImage(with: url)
        labelNewMovieName.text = "Kate"
        labelActorsNewMovie.text = "lorem psum - lorempseu - lorepsum"
        labelActorsNewMovie.textColor = .gray
        
    }
    func setupNavigation(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func setupCollections() {
        collectionViewForYou.dataSource = self
        collectionViewForYou.delegate = self
        collectionViewForYou.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
    }
    func bindEvents() {
        viewModel.updateLayout = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionViewForYou.reloadData()
                
            }
        }
        
    }
}

//MARK: - Extensions
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2)-20 , height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getMoviesQuantity()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
        UICollectionViewCell {
        let intem = viewModel.getMovieAt(indexPath.item)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell.init(frame: .zero)
        }
        cell.setupModel(intem)
        return cell
    }
    
}
