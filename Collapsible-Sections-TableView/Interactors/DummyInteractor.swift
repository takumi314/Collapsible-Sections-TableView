//
//  DummyInteractor.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

/*
 * The Interactor responsible for implementing
 * the business logic of the module.
 */
class DummyInteractor {

    // Url to the desired API.
    let url = ""

    // Reference to the Presenter's output interface.
    weak var output: DummyInteractorOutput?

}

///
/// API(レポジトリ)からInteractorへ
///
extension DummyInteractor: DummyInteractorInput {

    // MARK: - DummyInteractorInput

    func fetchDummy() {

        let dummies = (0..<5).map { (i) -> DummyObject in
            var dummy = DummyObject()
            dummy.rows = [1, 2, 3]
            return dummy
        }

        output?.dummyFetched(dummies)
    }

}
