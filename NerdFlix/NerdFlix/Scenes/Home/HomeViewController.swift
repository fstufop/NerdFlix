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
    
    //MARK: - Overrides
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tudumPlayer()
        player.play()
        setupNavigation()
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
    //MARK: - Extensions
    
    
    
    
}
