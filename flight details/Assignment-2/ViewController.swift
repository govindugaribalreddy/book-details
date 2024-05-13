//
//  ViewController.swift
//  Assignment-2
//
//  Created by BALREDDY GOVINDUGARI on 10/31/23.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let names=["science","math","biology"]
    var book: [Books] = []
    @IBOutlet weak var bookTable: UITableView!
    
    
    @IBOutlet weak var labelBook: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)as! bookCell

        // Configure the cell...
       
                
        cell.labelTitledis.text = book[indexPath.row].title
               

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy"

                let date = book[indexPath.row].duedate!
                let dateString = dateFormatter.string(from: date)
                
                cell.labelDatedis.text = dateString
                    
                 return cell
        
    }
    

    @IBAction func addBook(_ sender: Any) {performSegue(withIdentifier: "addbook2details", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bookTable.reloadData()
                fetchAndSortData()
    }

    func fetchAndSortData() {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                let managedContext = appDelegate.persistentContainer.viewContext
                let fetchRequest: NSFetchRequest<Books> = Books.fetchRequest()
                let sortDescriptor = NSSortDescriptor(key: "duedate", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                do {
                    book = try managedContext.fetch(fetchRequest)
                    bookTable.reloadData()
                } catch {
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "bookDetail" {
                if let indexPath = bookTable.indexPathForSelectedRow {
                    // Get the selected book from your data source (e.g., an array of books)
                    let selectedBook = book[indexPath.row]
                    
                    // Pass the selected book to the destination view controller
                    if let destinationVC = segue.destination as? bookInfo {
                        destinationVC.item = selectedBook
                    }
                }
            }
        }
}

