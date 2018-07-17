//
//  NewsItemCell.swift
//  StretchyHeader
//
//  Created by Fariha on 7/17/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

import UIKit

class NewsItemCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let newsItem = newsItem {
                categoryLabel.text = newsItem.category.toString()
                categoryLabel.textColor = newsItem.category.toColor()
                headlineLabel.text = newsItem.headline
            } else {
                categoryLabel.text = nil
                headlineLabel.text = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
