//
//  DummyPresenter.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

/*
 * The Presenter is also responsible for connecting
 * the other objects inside a VIPER module.
 */
class DummyPresenter: NSObject {

    // Reference to the View (weak to avoid retain cycle).
    weak var view: DummyViewInterface?

    // Reference to the Interactor's interface.
    var interactor: DummyInteractorInput!

    // Reference to the Router
    var router: DummyWireframe!

    var dummies: [DummyObject] = [] {
        didSet {
            if dummies.count > 0 {
                view?.showArticlesData(dummies: dummies)
            } else {
                view?.showNoContentScreen()
            }
        }
    }

}


///
/// ViewからPresenterへ
///
extension DummyPresenter: DummyModuleInterface {

    // MARK: - DummyModuleInterface

    func viewDidLoad() {
        
    }

    func updateView() {
        interactor.fetchDummy()
    }

    func showDetailsForDummies(_ dummies: DummyObject) {
        
    }

}


///
/// InteractorからPresenterへ
///
extension DummyPresenter: DummyInteractorOutput {

    // MARK: - DummyInteractorOutput

    func dummyFetched(_ dummies: [DummyObject]) {
        self.dummies = dummies
    }

    func dummyFetchFailed() {

    }

}
