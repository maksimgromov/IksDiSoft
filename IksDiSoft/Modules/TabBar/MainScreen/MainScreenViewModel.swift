//  
//  MainScreenViewModel.swift
//  IksDiSoft
//
//  Created by Максим Громов on 02.03.2022.
//

import BigNumber
import Combine
import Foundation

public final class MainScreenViewModel {
	
	public enum Action {
		case loadData
	}
	
	// MARK: - Data
	@Published
	public var tableViewModel: [BInt] = [BInt]()
	public var action: PassthroughSubject<Action, Never> = PassthroughSubject<Action, Never>()
	private var cancellables: Set<AnyCancellable> = []
	@Published
	public var screenType: MainScreenAssembly.MainSreenType = .primeNumbers
	private var numbersGenerationUpperBound: Int = 100
	
	public init(screenType: MainScreenAssembly.MainSreenType) {
		self.screenType = screenType
		loadData()
		action
			.receive(on: DispatchQueue.main)
			.sink { [weak self] action in
				switch action {
					
				case .loadData:
					self?.loadData()
				}
			}
			.store(in: &cancellables)
	}
		
	private func loadData() {
		numbersGenerationUpperBound += 50
		switch screenType {
			
		case .primeNumbers:
			eratosthenesSieve(to: numbersGenerationUpperBound)
		case .fibonacciNumbers:
			fibonacci(to: numbersGenerationUpperBound)
		}
	}
	
	private func eratosthenesSieve(to n: Int) {
		DispatchQueue.global(qos: .userInteractive).async {
			var composite = Array(repeating: false, count: n + 1)
			var primes: [BInt] = []
			if n >= 150 {
				let d = Double(n)
				let upperBound = Int(d / (log(d) - 4))
				primes.reserveCapacity(upperBound)
			} else {
				primes.reserveCapacity(n)
			}
			
			let squareRootN = Int(Double(n).squareRoot())
			var p = 2
			while p <= squareRootN {
				if !composite[p] {
					primes.append(BInt(p))
					for q in stride(from: p * p, through: n, by: p) {
						composite[q] = true
					}
				}
				p += 1
			}
			while p <= n {
				if !composite[p] {
					primes.append(BInt(p))
				}
				p += 1
			}
			if (self.tableViewModel.count == 0) {
				self.tableViewModel.append(contentsOf: primes)
			} else {
				self.tableViewModel.append(contentsOf: primes.filter {!self.tableViewModel.contains($0)})
			}
		}
	}
	
	private func fibonacci(to n: Int) {
		DispatchQueue.global(qos: .userInteractive).async {
			for i in 0...n {
				var a: BInt = 0
				var b: BInt = 1
				for _ in 0..<i {
					a += b
					b = a - b
				}
				if !self.tableViewModel.contains(a) {
					self.tableViewModel.append(a)
				}
			}
		}
	}
}
