//
//  ViewController.swift
//  NavBar
//
//  Created by Nikita Levintsov on 9/26/16.
//  Copyright © 2016 NikitaLevintsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var chooseRoom: UISegmentedControl!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // put UIImage view on the navigation bar
        let title: UIImage = #imageLiteral(resourceName: "Icon")
        let image: UIImageView = UIImageView(image: title)
        self.navigationItem.titleView = image
        
        // remove segmented control's border
        chooseRoom.layer.cornerRadius = 5
        chooseRoom.layer.masksToBounds = true
        chooseRoom.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .normal)
        chooseRoom.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .selected)
        chooseRoom.removeBorders()
        
        /// navigation bar
        self.navigationController?.navigationBar.isTranslucent = false
        // remove 1px bottom line
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        /// Table view
        self.tableView.contentInset = UIEdgeInsets(top: 109, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: UIColor.lightGray), for:.normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: UIColor.black), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.black, width: 0), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor, width: CGFloat = 1.0) -> UIImage {
        let rect = CGRect(x:0.0, y:0.0, width:1.0, height:40.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

extension UIViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell != nil {
        
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        cell?.textLabel?.text = "1"
        cell?.backgroundColor = indexPath.row % 2 == 0 ? UIColor.yellow : UIColor.purple
        return cell!
    }
}


