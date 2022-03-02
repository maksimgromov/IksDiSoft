//
//  UIView + Extension.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import UIKit

extension UIView {
	@discardableResult
	func cornerCurve(value: CALayerCornerCurve) -> UIView {
		self.layer.cornerCurve = value
	
		return self
	}
	
	@discardableResult
	func backgroundColor(value: UIColor) -> UIView {
		self.backgroundColor = value
	
		return self
	}
	
	@discardableResult
	func cornerRadius(value: CGFloat) -> UIView {
		self.layer.cornerRadius = value
		
		return self
	}
	
	@discardableResult
	func maskToBounds(value: Bool) -> UIView {
		self.layer.masksToBounds = value
		
		return self
	}
	
	@discardableResult
	func clipsToBounds(value: Bool) -> UIView {
		self.clipsToBounds = value
		
		return self
	}
	
	@discardableResult
	func layerBackgroundColor(value: UIColor) -> UIView {
		self.layer.backgroundColor = value.cgColor
	
		return self
	}
	
	@discardableResult
	func shadowOpacity(value: Float) -> UIView {
		self.layer.shadowOpacity = value
		
		return self
	}
	
	@discardableResult
	func shadowOffset(value: CGSize) -> UIView {
		self.layer.shadowOffset = value
		
		return self
	}
	
	@discardableResult
	func shadowColor(value: UIColor) -> UIView {
		self.layer.shadowColor = value.cgColor
		
		return self
	}
	
	@discardableResult
	func tintColor(value: UIColor) -> UIView {
		self.tintColor = value
		
		return self
	}
	
	@discardableResult
	func borderWidth(value: CGFloat) -> UIView {
		self.layer.borderWidth = value
		
		return self
	}
	
	@discardableResult
	func borderColor(value: UIColor) -> UIView {
		self.layer.borderColor = value.cgColor
		
		return self
	}
	
	@discardableResult
	func shadowRadius(value: CGFloat) -> UIView {
		self.layer.shadowRadius = value
		
		return self
	}
	
	@discardableResult
	func maskedCorners(value: CACornerMask) -> UIView {
		self.layer.maskedCorners = value
		
		return self
	}
	
	@discardableResult
	func alpha(value: CGFloat) -> UIView {
		self.alpha = value
		
		return self
	}
}

