//
//  DummyViewController.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit


/*
 * A view responsible for displaying a list
 * of articles fetched from some source.
 */
class DummyViewController: UIViewController {

    // Reference to the Presenter's interface.
    var presenter: DummyModuleInterface!

    var dummies: [DummyObject] = [] {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.updateView()
    }

}

extension DummyViewController: DummyViewInterface {

    func showArticlesData(dummies: [DummyObject]) {
        self.dummies = dummies
    }

    func showNoContentScreen() {

    }

}
