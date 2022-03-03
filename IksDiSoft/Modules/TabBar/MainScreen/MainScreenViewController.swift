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
	@IBOutlet weak var tableView: MainScreenUITableView!
	
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
		tableView.register(R.nib.mainScreenUITableViewCell)
	}
	
	private func binding() {
		viewModel.$screenType
			.receive(on: DispatchQueue.main)
			.sink { [weak self] screenType in
				switch screenType {
					
				case .fibonacciNumbers:
					self?.navigationItem.title = R.string.localizable.mainScreenFibonacciNaumbersLabelText()
				case .primeNumbers:
					self?.navigationItem.title = R.string.localizable.mainScreenNumbersLabelText()
				}
			}
			.store(in: &cancellables)
		viewModel.$tableViewModel
			.receive(on: DispatchQueue.main)
			.sink { [weak self] model in
				self?.tableView.configure(model)
			}
			.store(in: &cancellables)
		tableView.action
			.receive(on: DispatchQueue.main)
			.sink { [weak self] action in
				switch action {
					
				case .loadMoreData:
					self?.viewModel.action.send(.loadMoreData)
				}
			}
			.store(in: &cancellables)
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
}
