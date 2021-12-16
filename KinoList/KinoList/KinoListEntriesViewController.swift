//
//  ViewController.swift
//  KinoList
//
//  Created by floofie on 12/8/21.
//

import UIKit
class EntryCell: UITableViewCell {
    
    @IBOutlet var entryTitleCell: UILabel!
    override func prepareForReuse() {
        textLabel?.text = ""
    }
}

class KinoListEntriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddEntryProtocol{
    let entryCellIdentifier = "EntryCell"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddEntryViewController {
            print("delegate set")
            destination.delegate = self
            
        }
        let destinationProfile = segue.destination as? ProfileViewController
        destinationProfile?.entryTotal = entryList.count
        destinationProfile?.watchTotal = watchList.count
        destinationProfile?.completedTotal = finishList.count
        destinationProfile?.plannedTotal = planList.count
        destinationProfile?.droppedTotal = dropList.count
        let sumList = ratingList.reduce(0,+)
        let avgRatings = sumList / ratingList.count
        destinationProfile?.avgRatingTotal = avgRatings
    }
    @IBOutlet weak var tableView: UITableView!
    var entryList: [EntryItem] = [
        EntryItem(title:"American Psycho", progress: 1, rating: 10, status: "Finished")
    ]
    var watchList: [EntryItem] = []
    var finishList: [EntryItem] = []
    var planList: [EntryItem] = []
    var dropList: [EntryItem] = []
    var ratingList: [Int] = [1]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
//        entryList = store.getAllEntryItems()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let entryItem = self.entryList[indexPath.row]
        if entryItem.status == "Watching" {
            cell.backgroundColor = UIColor.systemGreen
        } else if entryItem.status == "Finished" {
            cell.backgroundColor = UIColor.systemBlue
        } else if entryItem.status == "Planned" {
            cell.backgroundColor = UIColor.systemOrange
        } else if entryItem.status == "Dropped" {
            cell.backgroundColor = UIColor.systemPink
        }
        cell.textLabel?.text = "\(entryItem.title) - 🎞 \(entryItem.progress) - ⭐️ \(entryItem.rating)"
        print(entryItem)
        return cell
    }
    func addEntryItem(entryTitle: String, entryProgress: Int, entryStatus:String, entryRating:Int) {
        let newEntryItem = EntryItem(title: entryTitle, progress: entryProgress, rating:entryRating, status: entryStatus)
        watchList = entryList.filter{$0.status == "Watching"}
        self.entryList.append(newEntryItem)
        if newEntryItem.status == "Watching" {
            self.watchList.append(newEntryItem)
        } else if newEntryItem.status == "Finished" {
            self.finishList.append(newEntryItem)
        } else if newEntryItem.status == "Planned" {
            self.planList.append(newEntryItem)
        } else {
            self.dropList.append(newEntryItem)
        }
        self.ratingList.append(newEntryItem.rating)
        tableView.reloadData()
    }
}

