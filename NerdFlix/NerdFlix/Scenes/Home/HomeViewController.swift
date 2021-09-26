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
        let url = URL(string: " ")
        imageViewNewMovie.kf.setImage(with: url)
        tudumPlayer()
        player.play()
        setupNavigation()
        setupCollections()
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
        return CGSize(width: (UIScreen.main.bounds.width/2)-20 , height: 200)
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
