////
////  ReusableCardView.swift
////  Dhivya_K_Zuper_UseCase
////
////  Created by Kalyanasundaram, Dhivya (Cognizant) on 12/07/25.
////
//
//import SwiftUI
//
//struct ReusableCardView: View {
//    let event: Service
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            HStack {
//                Text(event.title)
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                Spacer()
//                switch event.status {
//                case .active:
//                    Circle()
//                        .fill(Color.green)
//                        .frame(width: 10, height: 10)
//                default:
//                    Circle()
//                        .fill(Color.green)
//                        .frame(width: 10, height: 10)
//                }
//            }
//
//            HStack(spacing: 8) {
//                Image(systemName: "building.2")
//                    .foregroundColor(.gray)
//                Text(event.customerName)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//
//            HStack(spacing: 8) {
//                Image(systemName: "paintbrush")
//                    .foregroundColor(.gray)
//                Text(event.description)
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//
//            HStack {
////                Text(event.status)
////                    .font(.caption)
////                    .padding(.horizontal, 8)
////                    .padding(.vertical, 4)
////                    .background(Color.blue.opacity(0.2))
////                    .cornerRadius(8)
//
//                Spacer()
//
//                Text(event.scheduledDate)
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//        }
//        .padding()
//        .background(Color.white)
//        .cornerRadius(16)
//        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
//        .padding(.horizontal)
//    }
//}
//
//
//
//#Preview {
//    ReusableCardView(event: Service(from: JSONDecoder() as! Decoder))
//}
