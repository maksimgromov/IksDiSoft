//
//  TabBarController.swift
//  IksDiSoft
//
//  Created by Максим Громов on 03.03.2022.
//

import UIKit

public final class TabBarController: UITabBarController {
	
	// MARK: - Object Lifecycle
	public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
	}
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		configure()
	}
	
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		configure()
	}
	
	// MARK: - Tabbar Configuration
	private func configure() {
		tabBar.backgroundColor(value: R.color.white_FFFFFF()!)
		tabBar.clipsToBounds(value: false)
		tabBar.shadowColor(value: R.color.blackOpacity16_000000()!)
		tabBar.shadowOpacity(value: 1)
		tabBar.shadowRadius(value: 0)
		tabBar.shadowOffset(value: CGSize(width: 0, height: -0.5))
		tabBar.isOpaque = false
		tabBar.isTranslucent = false
		tabBar.tintColor = R.color.dodgerBlue_309CF4()
		
		let mainScreenAssembly: MainScreenAssembly = MainScreenAssembly()
		let mainScreenNavigationController = UINavigationController(rootViewController: mainScreenAssembly.view)
		mainScreenNavigationController.tabBarItem.title = R.string.localizable.tabBarMainText()
		mainScreenNavigationController.tabBarItem.image = R.image.tabBar.main()
		mainScreenNavigationController.tabBarItem.setTitleTextAttributes([.font: R.font.segoeUIRegular(size: 12)!, .foregroundColor: R.color.dodgerBlue_309CF4()!], for: .selected)
		mainScreenNavigationController.tabBarItem.setTitleTextAttributes([.font: R.font.segoeUIRegular(size: 12)!, .foregroundColor: R.color.frenchGray_C8C7CC()!], for: .normal)
		
		let secondScreenAssembly: MainScreenAssembly = MainScreenAssembly(screenType: .fibonacciNumbers)
		let secondScreenNavigationController = UINavigationController(rootViewController: secondScreenAssembly.view)
		secondScreenNavigationController.tabBarItem.title = R.string.localizable.tabBarSecondText()
		secondScreenNavigationController.tabBarItem.image = R.image.tabBar.second()
		secondScreenNavigationController.tabBarItem.setTitleTextAttributes([.font: R.font.segoeUIRegular(size: 12)!, .foregroundColor: R.color.dodgerBlue_309CF4()!], for: .selected)
		secondScreenNavigationController.tabBarItem.setTitleTextAttributes([.font: R.font.segoeUIRegular(size: 12)!, .foregroundColor: R.color.frenchGray_C8C7CC()!], for: .normal)
		
		viewControllers = [
			mainScreenNavigationController,
			secondScreenNavigationController
		]
	}
}
