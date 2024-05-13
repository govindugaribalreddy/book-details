//
//  bookInfo.swift
//  Assignment-2
//
//  Created by BALREDDY GOVINDUGARI on 10/31/23.
//

import UIKit

class bookInfo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let book = item {
            textlbl.text = book.title
            Authorlbl1.text = book.author
            subjectlbl1.text = book.subjectname
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy"

                    let date = book.duedate!
                    let dateString = dateFormatter.string(from: date)
                       
            duedatelbl1.text = dateString
                   }
    }
    var item : Books?
    @IBOutlet weak var duedatelbl1: UILabel!
    @IBOutlet weak var subjectlbl1: UILabel!
    @IBOutlet weak var Authorlbl1: UILabel!
    @IBOutlet weak var textlbl: UILabel!
    
    
     @IBAction func update(_ sender: Any) {
         performSegue(withIdentifier:"bookedit", sender: self)
     }
    @IBAction func deletebtn(_ sender: Any) {
        if let bookToDelete = item {
                    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

                    // Create a confirmation alert
                    let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this book?", preferredStyle: .alert)

                    // Add actions to the alert
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Delete", style: .destructive) { _ in
                        // User tapped "Delete," so proceed with book deletion
                        context.delete(bookToDelete)

                        do {
                            try context.save()
                            if let presentingVC = self.presentingViewController as? ViewController {
                                                presentingVC.fetchAndSortData()
                                               }
                            self.dismiss(animated: true)
                            // Navigate back to the previous view controller
                            self.navigationController?.popViewController(animated: true)
                        } catch {
                            print("Error deleting book: \(error)")
                        }
                    })

                    // Present the alert
                    present(alert, animated: true, completion: nil)
                }
    }
    
    func didEditBook(_ editedBook: Books) {
                // Update the details view with the edited book
                // e.g., reload labels with the new data
            item?.title = editedBook.title
            item?.author = editedBook.author
            item?.subjectname = editedBook.subjectname
            if let presentingVC = self.presentingViewController as? ViewController {
                                presentingVC.fetchAndSortData()
                               }
            }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "editBook" {
                if let destinationVC = segue.destination as? UpdateVc {
                    destinationVC.Editbook = item
                }
                func didEditBook(_ editedBook: Books) {
                        // Update the details view with the edited book
                        // e.g., reload labels with the new data
                    item?.title = editedBook.title
                    item?.author = editedBook.author
                    item?.subjectname = editedBook.subjectname
                    if let presentingVC = self.presentingViewController as? ViewController {
                                        presentingVC.fetchAndSortData()
                                       }
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

}
