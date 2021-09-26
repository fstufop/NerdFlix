//
//  HomeViewController.swift
//  NerdFlix
//
//  Created by BootCamp on 24/09/21.
//

import UIKit
import AVFoundation
import Kingfisher
import SkeletonView

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
    @IBOutlet weak var collectionViewTop250Films: UICollectionView!
    @IBOutlet weak var collectionViewCommingSoon: UICollectionView!
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
        viewModel.getTop250Films()
        viewModel.getCommingSoon()
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
        collectionViewTop250Films.dataSource = self
        collectionViewTop250Films.delegate = self
        collectionViewTop250Films.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
//        collectionViewForYou.isSkeletonable = true
//        collectionViewForYou.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .concrete), animation: nil, transition: .crossDissolve(0.25))
        collectionViewForYou.dataSource = self
        collectionViewForYou.delegate = self
        collectionViewForYou.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionViewCommingSoon.dataSource = self
        collectionViewCommingSoon.delegate = self
        collectionViewCommingSoon.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
    }
    func bindEvents() {
        viewModel.updateLayout = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionViewForYou.reloadData()
            }
        }
        viewModel.updateLayout2 = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionViewTop250Films.reloadData()
            }
        }
        viewModel.updateLayout3 = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionViewCommingSoon.reloadData()
            }
        }
    }
}

//MARK: - Extensions
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
//    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return MovieCollectionViewCell.reuseIdentifier
//    }
//    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.getMoviesQuantity()
//    }
//
    
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
        let item = viewModel.getMovieAt(indexPath.item)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell.init(frame: .zero)
        }
        cell.setupModel(item)
        return cell
    }
    
}
