//
//  HomeViewController.swift
//  NerdFlix
//
//  Created by BootCamp on 24/09/21.
//

import UIKit
import AVFoundation


class HomeViewController: UIViewController {
    
    
    
    //MARK: - Properties
    var player = AVAudioPlayer()
    //MARK: - Outlets
    
    //MARK: - Actions
    @IBOutlet weak var collectionViewForYou: UICollectionView!
    
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
}
//MARK: - Extensions
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2)-20 , height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell.init(frame: .zero)
        }
        return cell
    }
    
}

//extension HomeViewController: UICollectionViewDelegate {
//
//}
