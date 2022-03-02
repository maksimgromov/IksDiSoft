//
//  MainScreenUITableView.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import UIKit

public final class MainScreenUITableView: UITableView {

	// MARK: - Data
	private var model: [Int] = [Int]()

	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		dataSource = self
		separatorColor = R.color.clear_000000()
		showsVerticalScrollIndicator = false
		showsHorizontalScrollIndicator = false
	}
	
	public func configure(_ model: [Int]) {
		self.model = model
		reloadData()
	}
}

// MARK: - UITableViewDataSource
extension MainScreenUITableView: UITableViewDataSource {
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return model.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.mainScreenUITableViewCell, for: indexPath) {
			cell.configure([model[indexPath.row], model[indexPath.row + 2]])
			return cell
		}
		
		return UITableViewCell()
	}
}

//// MARK: - UITableViewDataSourcePrefetching
//extension ListUITableView: UITableViewDataSourcePrefetching {
//
//	public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//		if (products.count > 0) {
//			let urls = indexPaths.map {URL(string: products[$0.row].product.mainImage)!}
//			prefetcher.startPrefetching(with: urls)
//		}
//	}
//
//	public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
//		if (products.count > 0) {
//			let urls = indexPaths.map {URL(string: products[$0.row].product.mainImage)!}
//			prefetcher.stopPrefetching(with: urls)
//		}
//	}
//}
