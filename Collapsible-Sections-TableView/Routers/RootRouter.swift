//
//  RootRouter.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {

    func presentDummyScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = DummyRouter.assembleModule()
    }
}

