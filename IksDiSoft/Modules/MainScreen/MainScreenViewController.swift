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
	private lazy var switchButton: UIButton = {
		let switchButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
		switchButton.setImage(UIImage(systemName: "arrow.down.square")?.withTintColor(R.color.white_FFFFFF()!).withRenderingMode(.alwaysOriginal), for: .normal)
		
		return switchButton
	}()
    
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
		viewModel.action.send(.preloadData)
		tableView.register(R.nib.mainScreenUITableViewCell)
	}
	
	private func binding() {
		viewModel.$tableViewModel
			.receive(on: DispatchQueue.main)
			.sink { [weak self] model in
				self?.tableView.configure(model)
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
		navigationItem.title = R.string.localizable.mainScreenNumbersLabelText()
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: switchButton)
	}
}
