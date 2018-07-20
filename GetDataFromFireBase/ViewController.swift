//
//  ViewController.swift
//  GetDataFromFireBase
//
//  Created by Mohamed ELfishawy on 7/20/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseCore

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var TableV1: UITableView!
    
    var ref:DatabaseReference?
    
    var DatabaseHandle:DatabaseHandle?
    
    

    
    

    var Centers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableV1.dataSource = self
        TableV1.delegate = self
        
        ref = Database.database().reference()
       DatabaseHandle =  ref?.child("pots").observe(.childAdded, with: { (snapshot) in
        let post = snapshot.value as?String
        if let actulpost = post {
             self.Centers.append(actulpost)
           self.TableV1.reloadData()
        }
       
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Centers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! q
        
        cell.lllll.text = Centers[indexPath.row] as! String
        
        return cell



}
}
