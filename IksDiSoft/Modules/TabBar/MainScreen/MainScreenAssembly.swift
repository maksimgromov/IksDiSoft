//  
//  MainScreenAssembly.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import Foundation

public final class MainScreenAssembly {
	
	public enum MainSreenType {
		case fibonacciNumbers
		case primeNumbers
	}

	// MARK: - Data
    private var viewController: MainScreenViewController?
	private var screenType: MainSreenType = .primeNumbers

    public var view: MainScreenViewController {
        guard let view = viewController else {
            viewController = MainScreenViewController()
            configureModule(viewController)
            return viewController!
        }
        return view
    }
	
	public convenience init() {
		self.init(screenType: .primeNumbers)
	}
	
	public init(screenType: MainScreenAssembly.MainSreenType) {
		self.screenType = screenType
	}
    
    private func configureModule(_ view: MainScreenViewController?) {
        guard let view = view else { return }
		view.viewModel = MainScreenViewModel(screenType: screenType)
    }
}
