//
//  DummyRouter.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class DummyRouter: DummyWireframe {

    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DummyViewController") as! DummyViewController
        let presenter = DummyPresenter()
        let interactor = DummyInteractor()
        let router = DummyRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view

        return view
    }

    func presentDetailsInterfaceForArticle(article: DummyObject) {

        // Create the Router for the upcoming module.

        // Sends the article data to the next module's Presenter.

        // Presents the next View.

    }


}
