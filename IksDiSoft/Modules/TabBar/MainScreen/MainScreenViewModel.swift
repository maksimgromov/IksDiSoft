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
		case loadMoreData
	}
	
	// MARK: - Data
	@Published
	public var tableViewModel: [BInt] = [BInt]()
	public var action: PassthroughSubject<Action, Never> = PassthroughSubject<Action, Never>()
	private var cancellables: Set<AnyCancellable> = []
	@Published
	public var screenType: MainScreenAssembly.MainSreenType = .primeNumbers
	private var numbersGenerationUpperBound: Int = 50
	
	public init(screenType: MainScreenAssembly.MainSreenType) {
		self.screenType = screenType
		preloadData()
		action
			.receive(on: DispatchQueue.main)
			.sink { [weak self] action in
				switch action {
					
				case .loadMoreData:
					self?.loadMoreData()
				}
			}
			.store(in: &cancellables)
	}
	
	private func preloadData() {
		switch screenType {
			
		case .primeNumbers:
			tableViewModel.append(contentsOf: eratosthenesSieve(to: numbersGenerationUpperBound))
		case .fibonacciNumbers:
			fibonacci(to: numbersGenerationUpperBound)
		}
	}
	
	private func loadMoreData() {
		numbersGenerationUpperBound += 50
		switch screenType {
			
		case .primeNumbers:
			DispatchQueue.global(qos: .userInteractive).async {
				self.tableViewModel.append(contentsOf: self.eratosthenesSieve(to: self.numbersGenerationUpperBound).filter {!self.tableViewModel.contains($0)})
			}
		case .fibonacciNumbers:
			fibonacci(to: numbersGenerationUpperBound)
		}
	}
	
	private func eratosthenesSieve(to n: Int) -> [BInt] {
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
		return primes
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
