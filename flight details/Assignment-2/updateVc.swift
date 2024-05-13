//
//  UpdateVc.swift
//  Assignment-2
//
//  Created by BALREDDY GOVINDUGARI on 10/31/23.
//

import UIKit

class UpdateVc: UIViewController {
    var Editbook : Books?
    
    
    @IBOutlet weak var labeltitle: UITextField!
    
    @IBOutlet weak var labelSubject: UITextField!
    
    @IBOutlet weak var duedate: UIDatePicker!
    @IBOutlet weak var labelAuthor: UITextField!
   // @IBOutlet weak var duedate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
         labeltitle.text = Editbook?.title
         labelAuthor.text = Editbook?.author
         labelSubject.text = Editbook?.subjectname
         //duedate.date = (Editbook?.duedate)!
    }
    
    //  @IBAction func UpdateB(_ sender: Any) {
    
    /*let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     Editbook?.title = labeltitle.text
     Editbook?.author = labelAuthor.text
     // Update other attributes with user input
     Editbook?.subjectname = labelSubject.text
     
     Editbook?.duedate = duedate.date
     do {
     try context.save()
     // Return to the details view
     if let presentingVC = self.presentingViewController as? ViewController {
     presentingVC.fetchAndSortData()
     }
     
     self.dismiss(animated: true)
     navigationController?.popViewController(animated: true)
     } catch {
     print("Error saving edited book details: \(error)")
     }*/
    
    
    @IBOutlet weak var donebtn: UIButton!
    
    @IBAction func btnaction(_ sender: Any) {
        self.dismiss(animated: true)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        Editbook?.title = labeltitle.text
        Editbook?.author = labelAuthor.text
        // Update other attributes with user input
        Editbook?.subjectname = labelSubject.text
        
        Editbook?.duedate = duedate.date
        do {
            try context.save()
            // Return to the details view
            if let presentingVC = self.presentingViewController as? ViewController {
                presentingVC.fetchAndSortData()
            }
            
            self.dismiss(animated: true)
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error saving edited book details: \(error)")
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
