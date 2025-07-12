////
////  ServicesView.swift
////  Dhivya_K_Zuper_UseCase
////
////  Created by Kalyanasundaram, Dhivya on 12/07/25.
////
//
//import SwiftUI
//
//struct ServicesView: View {
//    @State private var searchText = ""
//
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(filteredNames, id: \.self) { name in
//                    Text(name)
//                }
//            }
//            .navigationTitle("Services")
//            .navigationBarTitleDisplayMode(.inline)
//            .searchable(text: $searchText, prompt: "Search names")
//        }
//    }
//
//    var filteredNames: [String] {
//        let names = ["Alice", "Bob", "Charlie", "Diana"]
//        return searchText.isEmpty ? names : names.filter { $0.localizedCaseInsensitiveContains(searchText) }
//    }
//}
//
//#Preview {
//    ServicesView()
//}
//import SwiftUI
//import Combine
//
//class SearchViewModel: ObservableObject {
//    @Published var searchText: String = ""
//    private var cancellables = Set<AnyCancellable>()
//    private var searchSubject = PassthroughSubject<String, Never>()
//
//    init() {
//        searchSubject
//            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
//            .removeDuplicates()
//            .sink { [weak self] query in
//                self?.performSearch(query: query)
//            }
//            .store(in: &cancellables)
//
//        $searchText
//            .sink { [weak self] text in
//                self?.searchSubject.send(text)
//            }
//            .store(in: &cancellables)
//    }
//
//    private func performSearch(query: String) {
//        print("Searching for: \(query)")
//        // Add your search logic here (e.g., API call or local filtering)
//    }
//}
