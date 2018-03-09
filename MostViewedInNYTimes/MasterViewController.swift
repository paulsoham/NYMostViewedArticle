//
//  MasterViewController.swift
//  MostViewedInNYTimes
//
//  Created by apple on 08/03/18.
//  Copyright © 2018 Soham Paul. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [NYArticles]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navColor = UIColor(red: 0.0/255.0, green: 228.0/255.0, blue: 196.0/255.0, alpha: 1.0)
        
        if let navContr = self.navigationController {
            navContr.navigationBar.barTintColor = navColor
        }
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
         let articleUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=0c8ab3df4b184fc8b69c83e207d11aaa"

        NYArticleDownloadManager.shared.startDownloadWithUrl(serverUrl: articleUrl) { (result) -> Void in
            self.objects = result as! [Any] as! [NYArticles]
            
            DispatchQueue.global().async(execute: {
                DispatchQueue.main.sync{
                    self.tableView.reloadData()
                }
            })
            
            
           
        }
        
        
        let hamburgerButton = UIBarButtonItem(image: UIImage(named: "hamburgerIcon.png"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = hamburgerButton

     
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action:nil)
        let menuButton = UIBarButtonItem(image: UIImage(named: "menuButton.png"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [menuButton,searchButton]
        
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        

    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] 
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object as NYArticles
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
        

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NYMasterTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "NYMasterTableViewCellID") as! NYMasterTableViewCell
        
        let object = objects[indexPath.row]
        cell.titleLabel?.text = object.title
        cell.byLineLabel?.text = object.byline
        cell.dateLabel?.text = object.published_date
        
        cell.accessoryType = .disclosureIndicator

        return cell
       
    }

 



}

