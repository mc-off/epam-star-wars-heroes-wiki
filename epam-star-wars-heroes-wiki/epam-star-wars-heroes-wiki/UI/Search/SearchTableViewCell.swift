//
//  SearchTableViewCell.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 15/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel:UILabel!
    @IBOutlet weak var cellSubLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
}
