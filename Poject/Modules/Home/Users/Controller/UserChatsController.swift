//
//  UserChatsController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class UserChatsController: BaseViewController {

    @IBOutlet weak var tableView: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
        addListener()
        viewModel.createView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigation()
    }
    
    lazy var viewModel: UserChatViewModel = {
        UserChatViewModel()
    }()

}

extension UserChatsController: Customize{
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
        tableView.registerCells(UserChatTableCell.self)
    }
}

extension UserChatsController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userChats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView.dequeueCell(UserChatTableCell.self, viewModel.userChats?[indexPath.item])
    }
}

extension UserChatsController{
    static func chats(_ chats: [UserModel]?, title: String) -> UIViewController{
        let controller: UserChatsController = UIViewController.load()
        controller.viewModel.userChats = chats
        controller.navTitle = title
        return controller
    }
}
