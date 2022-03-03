//
//  MainScreenUITableView.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import BigNumber
import Combine
import UIKit

public final class MainScreenUITableView: UITableView {
	
	public enum Action {
		case loadMoreData
	}

	// MARK: - Data
	public var action: PassthroughSubject<Action, Never> = PassthroughSubject<Action, Never>()
	private var model: [BInt] = [BInt]()

	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		dataSource = self
		prefetchDataSource = self
		separatorColor = R.color.clear_000000()
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
		if #available(iOS 15.0, *) {
			isPrefetchingEnabled = true
		}
	}
	
	public func configure(_ model: [BInt]) {
		DispatchQueue.main.async {
			self.model = model
			self.reloadData()			
		}
	}
}

// MARK: - UITableViewDataSource
extension MainScreenUITableView: UITableViewDataSource {
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if model.count % 2 == 0 {
			return model.count / 2
		} else {
			return model.count / 2 - 1
		}
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.mainScreenUITableViewCell, for: indexPath) {
			if indexPath.row % 2 == 0 {
				cell.configure([model[indexPath.row * 2], model[indexPath.row * 2 + 1]], alignment: .left)
			} else {
				cell.configure([model[indexPath.row * 2], model[indexPath.row * 2 + 1]], alignment: .right)
			}
			return cell
		}
		
		return UITableViewCell()
	}
}

// MARK: - UITableViewDataSourcePrefetching
extension MainScreenUITableView: UITableViewDataSourcePrefetching {

	public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		guard let lastRow = indexPaths.map({$0.row}).last else { return }
		if lastRow + 25 > tableView.numberOfRows(inSection: 0) {
			action.send(.loadMoreData)
		}
	}
}
