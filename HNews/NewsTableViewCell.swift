//
//  NewsTableViewCell.swift
//  HNews
//
//  Created by Ariunjargal on 2/22/16.
//  Copyright © 2016 Ariunjargal. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsLink: UILabel!
    @IBOutlet weak var newsInfo: UILabel!
    @IBOutlet weak var newsScore: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
