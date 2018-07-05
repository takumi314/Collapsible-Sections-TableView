//
//  DummyTableViewCell.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class DummyTableViewCell: UITableViewCell, Collapable {

    @IBOutlet weak var rowLabel: UILabel!

    var isCollapsed: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

