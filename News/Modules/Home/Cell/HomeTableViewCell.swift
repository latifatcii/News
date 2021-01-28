//
//  HomeTableViewCell.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func favButtonTapped(indexPath: IndexPath)
}

final class HomeTableViewCell: UITableViewCell {
    
    weak var delegate: HomeTableViewCellDelegate?
    static let reuseIdentifier = "HomeTableViewCell"
    var index: IndexPath!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func starButtonTapped(_ sender: Any) {
        delegate?.favButtonTapped(indexPath: index)
    }
 
    func switchFavButtonImage(isDataFavorited: Bool) {
        if isDataFavorited {
            starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
}
