//  Skaik_mo
//
//  TitleCollectionViewCell.swift
//  DigitalCards
//
//  Created by Mohammed Skaik on 26/02/2023.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerStack: rStack!
    @IBOutlet weak var titleLabel: UILabel!

    var isSelectedCell = false
    var object: Any?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.width = ceil(size.width)
        frame.size.height = 50
        layoutAttributes.frame = frame
        return layoutAttributes
    }

    func configerCell() {
        if isSelectedCell {
            self.containerStack.backgroundColor = color_000000
            self.containerStack.borderColor = color_000000
            self.titleLabel.textColor = color_FFFFFF

        } else {
            self.containerStack.backgroundColor = color_F5F8FA
            self.containerStack.borderColor = color_E3E8EF
            self.titleLabel.textColor = color_000000
        }
        if let object = object as? String {
            self.titleLabel.text = object
        }
    }

}
