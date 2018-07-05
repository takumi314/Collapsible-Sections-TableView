//
//  DummyTableViewHeader.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol DummyHeaderViewDelegate: class {
    func toggleSection(header: DummyTableViewHeader, section: Int)
}

class DummyTableViewHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!

    var isCollapsed: Bool = true

    var section: Int = 0

    var delegete: DummyHeaderViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
    }

    @objc func didTapHeader() {
        delegete?.toggleSection(header: self, section: section)
    }

    func setCollapsed(_ collopsed: Bool) {
        isCollapsed = collopsed
    }

}
