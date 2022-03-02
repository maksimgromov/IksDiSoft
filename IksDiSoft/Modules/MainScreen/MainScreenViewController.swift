//  
//  MainScreenViewController.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import Combine
import UIKit

public final class MainScreenViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Data
    public var viewModel: MainScreenViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
	public required init?(coder: NSCoder) { fatalError() }

    public override func viewDidLoad() {
        super.viewDidLoad()
		configureView()
		binding()
    }
	
	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		configureNavigationBar()
	}
	
	private func configureView() {
		view.backgroundColor(value: R.color.white_FFFFFF()!)
	}
	
	private func binding() {
	}
	
	private func configureNavigationBar() {
		let navigationBarAppearance = XDSoftUINavigationBarAppearance()
		navigationController?.navigationBar.standardAppearance = navigationBarAppearance
		navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationItem.largeTitleDisplayMode = .automatic
		navigationController?.navigationBar.tintColor = R.color.mineshaft_333333()
		navigationItem.largeTitleDisplayMode = .automatic
	}

    // MARK: - Actions
}

// MARK: -
extension MainScreenViewController {
}
