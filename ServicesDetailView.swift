//
//  ServiceDetailView.swift
//  Dhivya_K_Zuper_UseCase
//
//  Created by Kalyanasundaram, Dhivya on 12/07/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct ServiceDetailView: View {
    let service: Service
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    //To get the corresponding coordinates for the location
    
    func getCoordinate(from address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let coordinate = placemarks?.first?.location?.coordinate {
                completion(coordinate)
            } else {
                completion(nil)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Map(coordinateRegion: $region)
                    .onAppear {
                        getCoordinate(from: service.location) { coordinate in
                            if let coordinate = coordinate {
                                region.center = coordinate
                            }
                        }
                    }
                    .frame(height: 200)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                HStack {
                    Text(service.title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    switch service.status {
                    case .active:
                        Text(service.status.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(8)
                    case .scheduled:
                        Text(service.status.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    case .completed:
                        Text(service.status.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(8)
                    case .inProgress:
                        Text(service.status.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                    case .urgent:
                        Text(service.status.rawValue)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    DetailRow(label: "Customer", value: service.customerName, image: "person.crop.circle")
                    DetailRow(label: "Description", value: service.description, image: "note.text")
                    DetailRow(label: "Scheduled Time", value: service.scheduledDate, image: "calendar.badge.clock")
                    DetailRow(label: "Location", value: service.location, image: "location.circle")
                    DetailRow(label: "Service Notes", value: service.serviceNotes, image: "square.and.pencil")
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle("Service Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    let label: String
    let value: String
    let image: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: image)
                    .foregroundColor(.blue)
                Text(label)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            Text(value)
                .font(.body)
        }
    }
}
