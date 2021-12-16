//
//  ProfileViewController.swift
//  KinoList
//
//  Created by floofie on 12/15/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var totalEntries: UILabel!
    @IBOutlet weak var watchingCount: UILabel!
    @IBOutlet weak var completedCount: UILabel!
    @IBOutlet weak var plannedCount: UILabel!
    @IBOutlet weak var droppedCount: UILabel!
    @IBOutlet weak var avgRating: UILabel!
    var entryTotal: Int = 0
    var watchTotal: Int = 0
    var completedTotal: Int = 0
    var plannedTotal: Int = 0
    var droppedTotal: Int = 0
    var avgRatingTotal: Int = 0
    override func viewDidLoad() {
            super.viewDidLoad()
        totalEntries.text = "\(entryTotal)"
        watchingCount.text = "\(watchTotal)"
        completedCount.text = "\(completedTotal)"
        plannedCount.text = "\(plannedTotal)"
        droppedCount.text = "\(droppedTotal)"
        avgRating.text = "\(avgRatingTotal)"
    }
}
