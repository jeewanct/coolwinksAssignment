//
//  TechnologiesController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class TechnologiesController: BaseViewController {

    @IBOutlet weak var tableView: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
        addListener()
        viewModel.createView()
    }
    
    lazy var viewModel: TechnologiesViewModel = {
        TechnologiesViewModel()
    }()
}

extension TechnologiesController: Customize{
    func addListener() {
        viewModel.showHUD.bind { [unowned self](show) in
            self.showHUD(show)
        }
        viewModel.reloadTable.bind { [unowned self](reload) in
            self.tableView.reloadData()
        }
    }
    func customInit() {
        configureNav()
        tableView.registerCells(TechnologiesTableCell.self)
    }
}

extension TechnologiesController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.technologies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView.dequeueCell(TechnologiesTableCell.self, viewModel.technologies?[indexPath.item])
    }
}

extension TechnologiesController{
    static func technologies(_ image: UIImage, _ title: String) -> TechnologiesController{
        let controller: TechnologiesController = UIViewController.load()
        controller.tabBarItem.image            = image
        controller.tabBarItem.title            = title
        return controller
    }
}
