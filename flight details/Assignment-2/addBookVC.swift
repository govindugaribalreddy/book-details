//
//  addBookVC.swift
//  Assignment-2
//
//  Created by BALREDDY GOVINDUGARI on 10/31/23.
//

import UIKit
import CoreData
class addBookVC: UIViewController {
    
    @IBOutlet weak var timepicker1: UIDatePicker!
    @IBOutlet weak var labelDuedate: UILabel!
    @IBOutlet weak var textSubject: UITextField!
    @IBOutlet weak var labelSubject: UILabel!
    @IBOutlet weak var textAuthor: UITextField!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelbookdeatlis: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // Create a new object
        let book = Books(context: context)
        book.title = textTitle.text
        book.author = textAuthor.text
        book.subjectname = textSubject.text
        book.duedate = timepicker1.date
        // Save the context
        do {
            try context.save()
            let alertController = UIAlertController(
                title: "Book Added",
                message: "Book added successfully!",
                preferredStyle: .alert
                
            )
            
            // Create an action for the alert
            let okAction = UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    // Handle the "OK" button tap
                    print("OK button tapped")
                    self.textTitle.text=""
                    self.textAuthor.text=""
                    self.textSubject.text=""
                    if let presentingVC = self.presentingViewController as? ViewController {
                        presentingVC.fetchAndSortData()
                    }
                    self.dismiss(animated: true)
                }
            )
            
            // Add the action to the alert controller
            alertController.addAction(okAction)
            
            // Present the alert
            present(alertController, animated: true, completion: nil)
        } catch {
            print("Error saving context: \(error)")
        }
        
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

