//
//  HomeTableViewCell.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "HomeTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func starButtonTapped(_ sender: Any) {
    }
    
}
