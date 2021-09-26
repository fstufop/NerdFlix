//
//  SeeMoreViewController.swift
//  NerdFlix
//
//  Created by BootCamp on 26/09/21.
//

import UIKit

class SeeMoreViewController: UIViewController {
    
    //MARK: - Properties
    private var viewModel: HomeViewModel = HomeViewModel()
    //MARK: - Outlets
    @IBOutlet weak var labelClassSeeMore: UILabel!
    @IBOutlet weak var collectioViewSeeMore: UICollectionView!
    //MARK: - Actions

    //MARK: - Overrides
    override func viewDidLoad() {
    super.viewDidLoad()
        title = "Ver Mais"
        viewModel.getPopularMovies()
        bindEvents()
        collectioViewSeeMore.dataSource = self
        collectioViewSeeMore.delegate = self
        collectioViewSeeMore.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        
    }
    //MARK: - Methods
    func bindEvents() {
        viewModel.updateLayout = { [weak self] in
            DispatchQueue.main.async {
                self?.collectioViewSeeMore.reloadData()
            }
        }
    }
}
    //MARK: - Extensions
extension SeeMoreViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2)-10, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getMoviesQuantity()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.getMovieAt(indexPath.item)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell.init(frame: .zero)
        }
        cell.setupModel(item)
        return cell
    }
}
