//
//  XDSoftUINavigationBarAppearance.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import UIKit

public final class XDSoftUINavigationBarAppearance: UINavigationBarAppearance {
	
	// MARK: - Data
	public override init(barAppearance: UIBarAppearance) {
		super.init(barAppearance: barAppearance)
		configure()
	}
	
	public override init(idiom: UIUserInterfaceIdiom) {
		super.init(idiom: idiom)
		configure()
	}
	
	public required init(coder: NSCoder) {
		super.init(coder: coder)
		configure()
	}
	
	private func configure() {
		backgroundColor = R.color.dodgerBlue_309CF4()
		titleTextAttributes = [NSAttributedString.Key.font: R.font.segoeUIRegular(size: 16)!, NSAttributedString.Key.foregroundColor: R.color.white_FFFFFF()!]
		largeTitleTextAttributes = [NSAttributedString.Key.font: R.font.segoeUIRegular(size: 36)!, NSAttributedString.Key.foregroundColor: R.color.white_FFFFFF()!]
	}
}
