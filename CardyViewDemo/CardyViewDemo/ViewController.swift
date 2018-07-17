//
//  ViewController.swift
//  CardyViewDemo
//
//  Created by 박길남 on 2018. 7. 17..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import UIKit
import sweet_tools

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var cellDatas:[cellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.initialCardyView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 30
        
        cellDatas.append(cellData(icon: UIImage(named: "1icon"), title: "My MacBook", contents: UIImage(named: "1.jpg")))
        cellDatas.append(cellData(icon: UIImage(named: "2icon"), title: "Gray emotion", contents: UIImage(named: "2.jpg")))
        cellDatas.append(cellData(icon: UIImage(named: "3icon"), title: "Thorn", contents: UIImage(named: "3.jpg")))
        cellDatas.append(cellData(icon: UIImage(named: "4icon"), title: "Rock", contents: UIImage(named: "4.jpg")))
        cellDatas.append(cellData(icon: UIImage(named: "5icon"), title: "Organized", contents: UIImage(named: "5.jpg")))
        
        tableView.register(CardyViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CardyViewCell
        
        let data = cellDatas[indexPath.row]
        
        if let icon = data.icon {
            cell.iconImageView.image = icon
        }
        
        if let title = data.title {
            cell.titleLabel.text = title
        }
        
        if let contents = data.contents {
            cell.contentsImageView.image = contents
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

