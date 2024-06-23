//
//  ActivityAddForm.swift
//  HabitCycle
//
//  Created by Görkem Güray on 23.06.2024.
//

import SwiftUI

struct ActivityAddForm: View {
    var activities:Activities
    
    @State private var activityName = ""
    @State private var activityDetail = ""
    @State private var activityCount = 0
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            
            Form {
                TextField("Name:", text: $activityName)
                TextField("Detail:", text: $activityDetail)
            } //Form
            .navigationTitle("Add New Activity")
            .toolbar {
                Button("Save") {
                    let activity = Activity(name: activityName, description: activityDetail, count: activityCount)
                    activities.allActivities.append(activity)
                    dismiss()
                } //Button
            } //toolbar
        } //NavigationStack
    } //body
}

#Preview {
    ActivityAddForm(activities: Activities())
}
