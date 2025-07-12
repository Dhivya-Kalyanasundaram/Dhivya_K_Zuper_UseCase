//
//  ContentView.swift
//  Dhivya_K_Zuper_UseCase
//
//  Created by Kalyanasundaram, Dhivya on 12/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ServiceListView(services: SampleData.generateServices())
                .navigationTitle("Services")
                .navigationBarTitleDisplayMode(.inline)
        }.searchable(text: $searchText)
    }
}

#Preview {
    ContentView()
}
