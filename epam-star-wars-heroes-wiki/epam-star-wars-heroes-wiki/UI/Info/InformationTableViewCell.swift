//
//  InformationTableViewCell.swift
//  epam-star-wars-heroes-wiki
//
//  Created by Артем Маков on 16/02/2020.
//  Copyright © 2020 Artem Makov. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {}
}
