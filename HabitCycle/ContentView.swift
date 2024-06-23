//
//  ContentView.swift
//  HabitCycle
//
//  Created by Görkem Güray on 19.06.2024.
//

import SwiftUI

@Observable
class Activities {
    var allActivities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(allActivities) {
                UserDefaults.standard.set(encoded, forKey: "allActivities")
            } //if let
        } //didSet
    } //var
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "allActivities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                allActivities = decodedItems
                return
            }
        }
        
        allActivities = []
    } //init()
}

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            if activities.allActivities.isEmpty {
                VStack {
                    Spacer()
                    
                    Image(.noData)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) {size, axis in
                            size*0.5
                        }
                } //VStack
            } //if
            List {
                ForEach(activities.allActivities) { activity in
                    NavigationLink("\(activity.name)", value: activity)
                } //ForEach
                .onDelete{ indexSet in
                    activities.allActivities.remove(atOffsets: indexSet)
                }
            } //List
            .navigationTitle(activities.allActivities.isEmpty ? "No Activity" : "All Activities")
            .toolbar {
                Button("Add activity", systemImage: "plus") {
                    showingAddActivity = true
                } //Button
            } //toolbar
            
            .sheet(isPresented: $showingAddActivity) {
                ActivityAddForm(activities: activities)
            } //sheet
            
            .navigationDestination(for: Activity.self) {selection in
                ActivityDetailsView(activity: selection, activities: activities)
            } //navigationDestination
            
            
        } //NavigationStack
        
    } //body
}

#Preview {
    ContentView()
}
