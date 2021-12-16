//
//  AddEntryViewController.swift
//  KinoList
//
//  Created by floofie on 12/14/21.
//

import UIKit
protocol AddEntryProtocol: AnyObject {
    func addEntryItem(entryTitle: String, entryProgress: Int, entryStatus:String, entryRating:Int)
}
class AddEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    weak var delegate: AddEntryProtocol?
    var todoItems: [EntryItem] = []
    var chosenStatus: Int = 0
    var statusPickerData: [String] = [String]()
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            statusPickerData = ["Watching", "Finished", "Planned", "Dropped"]
        }
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var progressField: UITextField!
    @IBOutlet weak var ratingField: UITextField!
    @IBOutlet weak var statusPicker: UIPickerView!
    var titleEntry: String? {
        guard
            let input = titleField.text
        else {
            return nil
        }
        return input
    }
    var progressEntry: Int? {
         guard
            let input: Int = Int(progressField.text!)
         else {
             return nil
         }
         return input
    }
    var ratingEntry: Int? {
        guard
           let input: Int = Int(ratingField.text!)
        else {
            return nil
        }
        return input
   }
    var statusEntry: String?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        statusEntry = statusPickerData[row]
        return statusEntry
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            chosenStatus = row
    }
    @IBAction func addEntryItem(_ sender: Any) {
        guard let titleEntry = titleEntry else {
            return
        }
        guard let progressEntry = progressEntry else {
            return
        }
        guard let statusEntry = statusEntry else {
            return
        }
        guard let ratingEntry = ratingEntry else {
            return
        }
        delegate?.addEntryItem(entryTitle: titleEntry, entryProgress: progressEntry, entryStatus: statusEntry, entryRating: ratingEntry)
        self.navigationController?.popViewController(animated: true)
        
    }
}
