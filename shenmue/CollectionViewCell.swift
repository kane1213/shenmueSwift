//
//  CollectionViewCell.swift
//  shenmue
//
//  Created by Mini on 2019/1/13.
//  Copyright © 2019年 Mini. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var numLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        numLabel = UILabel()
        contentView.addSubview(numLabel)
        numLabel.translatesAutoresizingMaskIntoConstraints = false
        let layout = contentView.layoutMarginsGuide
        numLabel.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        numLabel.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
        numLabel.textColor = UIColor.white
        numLabel.font = UIFont.systemFont(ofSize: 42)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
