//
//  TableViewController.swift
//  shenmue
//
//  Created by Mini on 2019/1/13.
//  Copyright © 2019年 Mini. All rights reserved.
//

import UIKit

struct Charactor {
    var name: String!
    var birthday: String!
    var weight: Int!
    var height: Int!
    var imgString: String!
}

class TableViewController: UIViewController {
    var tableView: UITableView!
    var charactors: [Charactor] = [
        Charactor(name: "Ryo", birthday: "1970/11/21", weight: 65, height: 180, imgString: "ryo"),
        Charactor(name: "Iwao", birthday: "1950/02/11", weight: 80, height: 178, imgString: "iwao"),
        Charactor(name: "Master", birthday: "1948/03/08", weight: 72, height: 174, imgString: "master"),
        Charactor(name: "Shenhua", birthday: "1978/03/08", weight: 48, height: 160, imgString: "shenhua"),
        Charactor(name: "Tom", birthday: "1960/01/24", weight: 85, height: 190, imgString: "tom"),
        Charactor(name: "Etsuko", birthday: "1977/10/21", weight: 50, height: 162, imgString: "etsuko")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.rowHeight = UITableView.automaticDimension
        
        navigationItem.title = "Charactors List"
        let dismissButton: UIBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeTableViewController(sender:)))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc func closeTableViewController(sender: UIBarButtonItem) {
        dismiss(animated: true) {
        }
    }

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.title.text = charactors[indexPath.item].name
        cell.detail.text = "weight: \(charactors[indexPath.item].weight ?? 0), height: \(charactors[indexPath.item].height ?? 0)"
        cell.birthday.text = charactors[indexPath.item].birthday
        cell.icon.image = UIImage(named: charactors[indexPath.item].imgString)
        print(charactors[indexPath.item].imgString)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
