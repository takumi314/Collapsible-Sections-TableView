//
///  DummyViewController.swift
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
    
    @IBOutlet weak var dummyTableView: DummyTableView!

    // Reference to the Presenter's interface.
    var presenter: DummyModuleInterface!

    var dummies: [DummyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.updateView()
        setup()
    }

    private func setup() {

        dummyTableView.estimatedRowHeight = 100
        dummyTableView.rowHeight = UITableViewAutomaticDimension
        dummyTableView.sectionHeaderHeight = 70
        dummyTableView.separatorStyle = .none

        dummyTableView.delegate = self
        dummyTableView.dataSource = self

        let cellNib = UINib(nibName: "DummyTableViewCell", bundle: Bundle.main)
        dummyTableView.register(cellNib, forCellReuseIdentifier: "DummyTableViewCell")

        let headerNib = UINib(nibName: "DummyTableViewHeader", bundle: Bundle.main)
        dummyTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "DummyTableViewHeader")
    }

}

extension DummyViewController: DummyViewInterface {

    func showArticlesData(dummies: [DummyObject]) {
        self.dummies = dummies
        dummyTableView.reloadData()
    }

    func showNoContentScreen() {

    }

}

extension DummyViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dummies.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummies[section].isCollapsed ? 0 : dummies[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DummyTableViewCell", for: indexPath) as! DummyTableViewCell

        cell.rowLabel?.text = "\(dummies[indexPath.section].rows[indexPath.row]) - row"

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DummyTableViewHeader")  as? DummyTableViewHeader {

            header.section = section
            header.titleLabel.text =  "\(section) - section"
            header.contentView.backgroundColor = .white

            header.setCollapsed(dummies[section].isCollapsed)
            header.delegete = self

            return header
        }

        return UIView()

    }

}

extension DummyViewController: DummyHeaderViewDelegate {
    func toggleSection(header: DummyTableViewHeader, section: Int) {
        let isCollapsed = header.isCollapsed

        header.setCollapsed(!isCollapsed)
        dummies[section].isCollapsed = !isCollapsed

        dummyTableView.beginUpdates()

        if isCollapsed {

            // セクション点滅を避けるため, セルを逐次追加する
            for i in 0..<dummies[section].count {
                dummyTableView.insertRows(at: [IndexPath(row: i, section: section)] , with: .fade)
            }

            // or `dummyTableView.reloadSections([section], with: .automatic)`

        } else {

            // セクション点滅を避けるため, セルを順に削除する. `.none`だと連続的に一番綺麗✨
            for i in 0..<dummies[section].count {
                dummyTableView.deleteRows(at: [IndexPath(row: i, section: section)] , with: .none)
            }

            // or `dummyTableView.reloadSections([section], with: .automatic)` でもOK


        }
        dummyTableView.endUpdates()

    }
}
