//
//  DummyContracts.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit


/*
 * Protocol that defines the view input methods.
 */
protocol DummyViewInterface: class {
    var presenter: DummyModuleInterface! { get set }

    func showArticlesData(dummies: [DummyObject])
    func showNoContentScreen()
}

/*
 * Protocol that defines the commands sent from the View to the Presenter.
 */
protocol DummyModuleInterface: class {
    var view: DummyViewInterface? { get set }
    var interactor: DummyInteractorInput! { get set }
    var router: DummyWireframe! { get set }

    func viewDidLoad()
    func updateView()
    func showDetailsForDummies(_ dummies: DummyObject)
}


/*
 * Protocol that defines the commands sent from the Interactor to the Presenter.
 */
protocol DummyInteractorOutput: class {
    func dummyFetched(_ dummies: [DummyObject])
    func dummyFetchFailed()
}

/*
 * Protocol that defines the Interactor's use case.
 */
protocol DummyInteractorInput: class {
    var output: DummyInteractorOutput? { get set }

    func fetchDummy()
}


/*
 * The Router responsible for navigation between modules.
 */
protocol DummyWireframe: class {

    // Reference to the ViewController (weak to avoid retain cycle).
    var viewController: UIViewController? { get set }

    // Reference to the Router of the next VIPER module.
    static func assembleModule() -> UIViewController

    func presentDetailsInterfaceForArticle(article: DummyObject)

}
