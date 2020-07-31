//
//  FriendsTableViewController.swift
//  notVK
//
//  Created by Roman on 31.03.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    @IBOutlet weak var searchTextField: UITextField!

    var myFriends = [FriendItemStruct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFriendsFromWeb()

        // MARK: - Table view properties
        self.clearsSelectionOnViewWillAppear = false
        //self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell

        //let friends = friendsSection[indexPath.section].items[indexPath.row]

        //cell.myFriendLabel.text = friends.firstName + " " + friends.lastName
        //cell.shadowLayer.image.image = UIImage(named: friends.fotoPath)
        
        cell.myFriendLabel.text = myFriends[indexPath.row].lastName + " " + myFriends[indexPath.row].firstName

        if let photoURL = URL(string: (myFriends[indexPath.row].photo100)!) {
            cell.shadowLayer.image.image = UIImage(data: try! Data(contentsOf: photoURL as URL))
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clickToDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let imagesVC = segue.destination as! FriendsCollectionViewController
                //imagesVC.friendsPhotos = friendsSection[indexPath.section].items[indexPath.row].photos
            }
        }
    }


    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        self.searchTextField.alpha = 0
                        self.view.layoutIfNeeded()
        })
        searchTextField.text = ""
        //sortedFriends(friends: allMyFriends)
        searchTextField.endEditing(true)
        tableView.reloadData()
    }
}

extension FriendsTableViewController {
    func loadFriendsFromWeb(){
        DispatchQueue.main.async {
            VKRequestService.shared.loadFriends { [weak self] (result) in
                switch result {
                case .success(let friendResponse):
                    self?.myFriends = friendResponse.response.items
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("error: ", error)
                }
            }
        }
    }
}
