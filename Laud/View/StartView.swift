//
//  ViewController.swift
//  Laud
//
//  Created by Hoff Henry Pereira da Silva on 06/05/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class StartView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension StartView {
    
    func setTableViewBackground() {
        let view = UIImageView(frame: tableView.frame)
        view.image = #imageLiteral(resourceName: "bg")
        view.contentMode = .scaleAspectFill
        view.alpha = 0.6
        tableView.backgroundView = view
    }
    
}

