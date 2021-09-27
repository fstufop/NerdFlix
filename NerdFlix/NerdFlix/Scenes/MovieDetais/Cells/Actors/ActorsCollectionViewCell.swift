//
//  ActorsCollectionViewCell.swift
//  NerdFlix
//
//  Created by BootCamp on 26/09/21.
//

import UIKit

class ActorsCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    
    //MARK: - Outlets
    @IBOutlet weak var imageViewBubble: UIImageView!
    @IBOutlet weak var viewBubble: UIView!
    
    //MARK: - Actions
    
    //MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        bubbleSetup()
    }
    //MARK: - Methods
    func bubbleSetup(){
        viewBubble.layer.cornerRadius = 68
    }
    
}
    //MARK: - Extensions
  


