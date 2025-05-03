//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct InterfaceSettingsView: View {    
    var body: some View {
        SettingsScreen(title: "Интерфейс",
                       description: "Измените свое восприятие Swiftgram, точечно изменяя интерфейс приложения.",
                       systemName: "square.grid.2x2",
                       color: .purple,
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
        InterfaceSettingsView()
    }
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

