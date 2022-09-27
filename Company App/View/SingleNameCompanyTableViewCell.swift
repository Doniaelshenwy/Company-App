//
//  SingleNameCompanyTableViewCell.swift
//  Company App
//
//  Created by Donia Elshenawy on 26/09/2022.
//

import UIKit

class SingleNameCompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameCompanyLabel: UILabel!
    func createShadowOfView(){
        nameView.layer.shadowColor = UIColor.lightGray.cgColor
        nameView.layer.shadowOpacity = 1
        nameView.layer.shadowOffset = .zero
        nameView.layer.shadowRadius = 2
        nameView.layer.borderWidth = 0
        nameView.layer.cornerRadius = 5
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
