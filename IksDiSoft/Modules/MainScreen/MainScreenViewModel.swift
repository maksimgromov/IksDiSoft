//  
//  MainScreenViewModel.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import Combine
import Foundation

public final class MainScreenViewModel {
	
	public enum Action {
		case preloadData
	}
	
	// MARK: - Data
	@Published
	public var tableViewModel: [Int] = [Int]()
	public var action: PassthroughSubject<Action, Never> = PassthroughSubject<Action, Never>()
	private var cancellables: Set<AnyCancellable> = []
	
	public init() {
		action
			.receive(on: DispatchQueue.main)
			.sink { [weak self] action in
				switch action {
					
				case .preloadData:
					self?.preloadData()
				}
			}
			.store(in: &cancellables)
	}
	
	private func preloadData() {
		for i in 0...100 {
			tableViewModel.append(i)
		}
	}
}
