//  
//  MainScreenViewModel.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import Combine
import Foundation

public final class MainScreenViewModel {
	
	public enum Action { }
	
	// MARK: - Data
	@Published
	public var action: PassthroughSubject<Action, Never> = PassthroughSubject<Action, Never>()
	private var cancellables: Set<AnyCancellable> = []
	
	public init() {
		action
			.receive(on: DispatchQueue.main)
			.sink { [weak self] action in
				switch action {
					
				}
			}
			.store(in: &cancellables)
	}
}
