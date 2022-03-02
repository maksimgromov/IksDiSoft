//  
//  MainScreenAssembly.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import Foundation

public final class MainScreenAssembly {
    
    private var viewController: MainScreenViewController?
    
    public var view: MainScreenViewController {
        guard let view = viewController else {
            viewController = MainScreenViewController()
            configureModule(viewController)
            return viewController!
        }
        return view
    }
    
    private func configureModule(_ view: MainScreenViewController?) {
        guard let view = view else { return }
        view.viewModel = MainScreenViewModel()
    }
}
