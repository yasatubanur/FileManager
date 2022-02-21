//
//  ViewController.swift
//  FileManager
//
//  Created by Tuba Nur YAŞA on 20.02.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                //this is a picture to load!
                pictures.append(item)
            }
        }
        print(pictures)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for:indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

}

