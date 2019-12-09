//
//  MasterViewController.swift
//  Case 1 Exam
//
//  Created by John Nikko Borja on 05/11/2019.
//  Copyright © 2019 John Nikko Borja. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case nameLabel = 0
    case year = 1
    case by = 2
}

class MasterViewController: UITableViewController, UISearchBarDelegate {

    let initialDataArray:[Model] = Model.generateModelArray()
    var dataArray:[Model] = Model.generateModelArray()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
//        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(sender:)))
//        singleTapGestureRecognizer.numberOfTapsRequired = 1
//        singleTapGestureRecognizer.isEnabled = true
//        singleTapGestureRecognizer.cancelsTouchesInView = false
//        self.view.addGestureRecognizer(singleTapGestureRecognizer)
        
        // start set up
        self.searchBarSetup()
    }
    
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name","Year","By"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataArray = initialDataArray
            self.tableView.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
            
        case selectedScope.nameLabel.rawValue:
            
            dataArray = initialDataArray.filter({ (mod) -> Bool in
                return mod.imageLbl.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.year.rawValue:

            dataArray = initialDataArray.filter({ (mod) -> Bool in
                return mod.imageYear.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
            
        case selectedScope.by.rawValue:

            dataArray = initialDataArray.filter({ (mod) -> Bool in
                return mod.imageBy.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            print("no type")
        }
    }
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        let model = dataArray[indexPath.row]
        
        cell.nameLbl.text = model.imageLbl
        
        cell.imgView.image = UIImage(named: model.imageName)
        
        cell.byLbl.text = model.imageBy
        cell.yearLbl.text = model.imageYear
        return cell
    }
    
    //add delegate method for pushing to new detail controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.dataModel = dataArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false;
    }
    
    // dismiss keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
//    @objc func singleTap(sender: UITapGestureRecognizer) {
//        sender.resignFirstResponder()
//    }
}

