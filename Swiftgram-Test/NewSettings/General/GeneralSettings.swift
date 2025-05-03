//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct GeneralSettingsView: View {
    var body: some View {
        SettingsScreen(title: "Основные",
                       description: "Настройте основные параметры Swiftgram, такие как истории, профили, перевод и жесты.",
                       systemName: "slider.horizontal.3",
                       color: .blue,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            NavigationLink {
                StoriesSettingsView()
            } label: {
                SettingsRow(title: "Истории", systemName: "circle.dashed.inset.fill", color: .orange)
            }
            NavigationLink {
                ProfilesSettingsView()
            } label: {
                SettingsRow(title: "Профили", systemName: "person.crop.circle", color: .coralBreeze)
            }
            NavigationLink {
                GesturesSettingsView()
            } label: {
                SettingsRow(title: "Жесты", systemName: "hand.point.up.fill", color: .blue)
            }
        }
    }
    
}

#Preview {
    NavigationView {
        GeneralSettingsView()
    }
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

