//
//  customTimelineTableViewCell.swift
//  Budget
//
//  Created by Benny Nguyen on 3/11/18.
//  Copyright © 2018 edu.uw.bennyn. All rights reserved.
//

import UIKit

class customTimelineTableViewCell: UITableViewCell {
  
  @IBOutlet weak var cellLbl: UILabel!
  @IBOutlet var buttons: [UIButton]!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
