//
//  MainScreenUITableViewCell.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import BigNumber
import UIKit

public final class MainScreenUITableViewCell: UITableViewCell {
	
	public enum Alignment {
		case left
		case right
	}
	
	// MARK: - Outlets
	@IBOutlet weak var leftLabel: UILabel!
	@IBOutlet weak var rightLabel: UILabel!
	
	// MARK: - Data
	public override func awakeFromNib() {
        super.awakeFromNib()
		selectionStyle = .none
		leftLabel.textColor = R.color.black_000000()
		leftLabel.textAlignment = .center
		leftLabel.font = R.font.segoeUIRegular(size: 50)
		leftLabel.backgroundColor(value: R.color.white_FFFFFF()!)
		rightLabel.textColor = R.color.black_000000()
		rightLabel.textAlignment = .center
		rightLabel.font = R.font.segoeUIRegular(size: 50)
		rightLabel.backgroundColor(value: R.color.white_FFFFFF()!)
    }

	public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	public override func prepareForReuse() {
		super.prepareForReuse()
		leftLabel.backgroundColor(value: R.color.white_FFFFFF()!)
		rightLabel.backgroundColor(value: R.color.white_FFFFFF()!)
	}
	
	public func configure(_ model: [BInt], alignment: Alignment = .left) {
		leftLabel.text = String(model[0])
		rightLabel.text = String(model[1])
		switch alignment {
			
		case .left:
			leftLabel.backgroundColor(value: R.color.frenchGray_C8C7CC()!)
		case .right:
			rightLabel.backgroundColor(value: R.color.frenchGray_C8C7CC()!)
		}
	}
}
