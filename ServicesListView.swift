//
//  ServiceListView.swift
//  Dhivya_K_Zuper_UseCase
//
//  Created by Kalyanasundaram, Dhivya on 12/07/25.
//

import SwiftUI
import Combine
import Foundation

struct ServiceListView: View {
    @StateObject private var viewModel: ServiceListViewModel

    init(services: [Service]) {
        _viewModel = StateObject(wrappedValue: ServiceListViewModel(services: services))
    }

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.filteredServices) { service in
                            NavigationLink(destination: ServiceDetailView(service: service)) {
                                ServiceCardView(service: service)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.top)
                }
                .refreshable {
                    await viewModel.refreshServices()
                }
            }
            .background(Color(.systemGroupedBackground))
            .searchable(text: $viewModel.searchText)
        }
    }
}

