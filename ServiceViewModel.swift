//
//  ServiceViewModel.swift
//  Dhivya_K_Zuper_UseCase
//
//  Created by Kalyanasundaram, Dhivya (Cognizant) on 12/07/25.
//

import Foundation
import Combine

class ServiceListViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var filteredServices: [Service] = []

    private var allServices: [Service] = []
    private var cancellables = Set<AnyCancellable>()

    init(services: [Service]) {
        self.allServices = services

        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { [weak self] query in
                self?.filterServices(with: query) ?? []
            }
            .assign(to: &$filteredServices)
    }
    
    func filterServices(with query: String) -> [Service] {
        guard !query.isEmpty else { return allServices }

        let lowercasedQuery = query.lowercased()

        return allServices.filter {
            $0.title.lowercased().contains(lowercasedQuery) ||
            $0.customerName.lowercased().contains(lowercasedQuery) ||
            $0.description.lowercased().contains(lowercasedQuery) ||
            $0.status.rawValue.lowercased().contains(lowercasedQuery)
        }
    }
}

extension ServiceListViewModel {
    
    @MainActor
    func refreshServices() async {
        try? await Task.sleep(nanoseconds: UInt64(Int.random(in: 2...3) * 1_000_000_000))
        filteredServices = filterServices(with: searchText)
    }
}
