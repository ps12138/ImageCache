//
//  PhotoTableViewCell.swift
//  ImageCache
//
//  Created by PSL on 1/17/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    // MARK: - Model
    var model: CellModel? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Views
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var alumbidLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView?.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateUI() {
        guard let model = model else {
            return
        }
//        photoImageView.download(imageFrom: model.url, placeHolder: "homeIcon_unselected.png")
        photoImageView.ic.download(imageFrom: model.url, placeHolder: "homeIcon_unselected.png")
        alumbidLabel.text = String(model.albumId)
        idLabel.text = String(model.id)
        titleLabel.text = model.title
    }
}







