//
//  ACellBook.swift
//  SimpleUIWebView
//
//  Created by RTC-HN154 on 10/11/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit
let kCellWidth: CGFloat = 100
let kLabelHeight: CGFloat = 40
class ACellBook: UICollectionViewCell {
    var nameLabel: UILabel!
    var imageView: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    override var intrinsicContentSize : CGSize {
        return CGSize(width: kCellWidth, height: kCellWidth + kLabelHeight);
    }
    
    func addSubviews() {
        if (imageView == nil) {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kCellWidth, height: kCellWidth))
            imageView.layer.borderColor = tintColor.cgColor
            contentView.addSubview(imageView)
        }
        
        if (nameLabel == nil) {
            nameLabel = UILabel(frame: CGRect(x: 0, y: kCellWidth, width: kCellWidth, height: kLabelHeight))
            nameLabel.textAlignment = .center
            nameLabel.textColor = UIColor.black
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFont(ofSize: 12)
            contentView.addSubview(nameLabel)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.layer.borderWidth = isSelected ? 2 : 0
        }
    }
    
}
