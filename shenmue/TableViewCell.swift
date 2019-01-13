//
//  TableViewCell.swift
//  shenmue
//
//  Created by Mini on 2019/1/13.
//  Copyright © 2019年 Mini. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    var icon: UIImageView!
    var title: UILabel!
    var detail: UILabel!
    var birthday: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        icon = UIImageView(image:UIImage(named: "ryo"))
        title = UILabel()
        detail = UILabel()
        birthday = UILabel()
        
        for tmp in [title, detail, birthday] {
            contentView.addSubview(tmp!)
            tmp!.translatesAutoresizingMaskIntoConstraints = false
        }
        contentView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        title.font = UIFont.systemFont(ofSize: 23)
        detail.font = UIFont.systemFont(ofSize: 16)
        birthday.font = UIFont.systemFont(ofSize: 10)
        

        
        let layout = contentView.layoutMarginsGuide
        let gap:CGFloat = 10
        icon.contentMode = .scaleAspectFit
        icon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        icon.topAnchor.constraint(equalTo: layout.topAnchor, constant: gap).isActive = true
        icon.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -gap).isActive = true
        icon.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: gap).isActive = true
        
        
        title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: gap).isActive = true
        title.trailingAnchor.constraint(equalTo: birthday.trailingAnchor, constant: -gap).isActive = true
        title.topAnchor.constraint(equalTo: icon.topAnchor).isActive = true
        
        detail.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        detail.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -gap).isActive = true
        detail.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        
        birthday.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: gap).isActive = true
        birthday.centerYAnchor.constraint(equalTo: title.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


