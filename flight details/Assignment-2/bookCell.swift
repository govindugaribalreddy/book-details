//
//  bookCell.swift
//  Assignment-2
//
//  Created by BALREDDY GOVINDUGARI on 10/31/23.
//

import UIKit

class bookCell: UITableViewCell {

    @IBOutlet weak var labelDatedis: UILabel!
    @IBOutlet weak var labelTitledis: UILabel!
    @IBOutlet weak var labelDuedate: UILabel!
    @IBOutlet weak var labelbookTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
