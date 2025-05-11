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
                       description: "Изменяйте различные элементы интерфейса Swiftgram, например экраны, или папки с чатами.",
                       systemName: "square.3.stack.3d",
                       color: .purple,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            NavigationLink {
                StoriesSettingsView()
            } label: {
                SettingsRow(title: "Экраны", systemName: "rectangle.stack.fill", color: .blue, smallerIcon: true)
            }
            
            NavigationLink {
                StoriesSettingsView()
            } label: {
                SettingsRow(title: "Папки с чатами", systemName: "folder.fill", color: .indigoMist, smallerIcon: true)
            }
            
            NavigationLink {
                StoriesSettingsView()
            } label: {
                SettingsRow(title: "Список чатов", systemName: "message.fill", color: .green, smallerIcon: false)
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

