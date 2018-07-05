//
//  DummyObject.swift
//  Collapsible-Sections-TableView
//
//  Created by NishiokaKohei on 2018/07/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation

protocol Countable {
    var count: Int { get }
}

protocol Collapable {
    var isCollapsed: Bool { get set }
}

struct DummyObject: Countable, Collapable {
    var count: Int {
        return rows.count
    }

    var rows: [Int] = []

    var isCollapsed: Bool = true

}

