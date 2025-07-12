//
//  ServiceCardView.swift
//  Dhivya_K_Zuper_UseCase
//
//  Created by Kalyanasundaram, Dhivya on 12/07/25.
//

import SwiftUI
import Foundation

struct ServiceCardView: View {
    let service: Service
    
    func formattedScheduledDate(from isoDateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        guard let date = isoFormatter.date(from: isoDateString) ??
                         ISO8601DateFormatter().date(from: isoDateString) else {
            return "Invalid date"
        }

        let calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"

        let timeString = dateFormatter.string(from: date)

        if calendar.isDateInToday(date) {
            return "Today, \(timeString)"
        } else if calendar.isDateInTomorrow(date) {
            return "Tomorrow, \(timeString)"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday, \(timeString)"
        } else {
            dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a"
            return dateFormatter.string(from: date)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(service.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                switch service.priority {
                case .low:
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                case .medium:
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 10, height: 10)
                case .high:
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 10, height: 10)
                case .critical:
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10)
                }
            }
            
            HStack(spacing: 8) {
                Image(systemName: "person.fill")
                    .foregroundColor(.blue)
                Text(service.customerName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 8) {
                Image(systemName: "doc.text")
                    .foregroundColor(.blue)
                Text(service.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack {
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
                Spacer()
                
                Text(formattedScheduledDate(from: service.scheduledDate))
                    .font(.caption)
                    .foregroundColor(.gray)

            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
