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
    
    let cellClassArr = [CardyViewCell.self, CardyViewCell.self, CardyViewCell.self, CardyViewCell.self, CardyViewCell.self]
    
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
        
        CardyViewCell.register(tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellClassArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = CardyViewCell()
        
        for c in cellClassArr {
            if c.isType() {
                cell = c.dequeueReusableCell(tableView: tableView) as! CardyViewCell
                cell.setData(data: cellDatas[indexPath.row])
            }
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

