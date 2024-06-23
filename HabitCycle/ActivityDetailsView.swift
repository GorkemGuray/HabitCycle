//
//  ActivityDetailsView.swift
//  HabitCycle
//
//  Created by Görkem Güray on 23.06.2024.
//

import SwiftUI

struct ActivityDetailsView: View {
    var activity: Activity
    var activities: Activities
    @State private var indexOfActivity = 0
    
    @State private var count = 0
    
    var body: some View {
        Form{
            Text("Count: \(count)")
                .font(.subheadline.bold())
            Text(activity.description)
                .font(.title2)
            
        } //Form
        .navigationTitle(activity.name)
        .onAppear {
            if let index = activities.allActivities.firstIndex(of: activity) {
                indexOfActivity = index
            } else {
                indexOfActivity = -1
            }
            count = activity.count
        }
        .toolbar {
            Button("+1") {
                if indexOfActivity >= 0 {
                    activities.allActivities[indexOfActivity].count = count + 1
                    count = activities.allActivities[indexOfActivity].count
                }
            }
        }
    } //body
}

#Preview {
    ActivityDetailsView(activity: Activity(name: "Test", description: "Test Açıklama", count: 8), activities: Activities())
}
