//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct ScreensSettingsView: View {
    @State var enableScreens: Bool { didSet {
        
    }}
    @State var enableContactsScreen: Bool { didSet {
        
    }}
    @State var enableCallsScreen: Bool { didSet {
        
    }}
    @State var showScreenNames: Bool { didSet {
        
    }}
    
    init() {
        self._enableScreens = State(initialValue: true)
        self._enableContactsScreen = State(initialValue: true)
        self._enableCallsScreen = State(initialValue: false)
        self._showScreenNames = State(initialValue: true)
    }
    
    var body: some View {
        SettingsScreen(title: "Вкладки",
                       description: "Вы можете отключить ненужные вам вкладки, а также настроить их отображение.",
                       systemName: "rectangle.stack.fill",
                       color: .blue,
                       smallerIcon: true,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            Section(footer: Text("Отключает нижнюю навигационную панель. Вы не сможете переключаться между вкладками.")) {
                Toggle(isOn: $enableScreens) {
                    SettingsRow(title: "Включить вкладки")
                }
            }
            
            if enableScreens {
                Section(header: Text("Отображение экранов")) {
                    Toggle(isOn: $enableContactsScreen) {
                        SettingsRow(title: "Вкладка \"Контакты\"")
                    }
                    Toggle(isOn: $enableCallsScreen) {
                        SettingsRow(title: "Вкладка \"Звонки\"")
                    }
                }
                
                Section(header: Text("Навигационная панель")) {
                    Toggle(isOn: $showScreenNames) {
                        SettingsRow(title: "Показывать названия вкладок")
                    }
                }
            }
            
        }
    }
    
}

#Preview {
    ScreensSettingsView()
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

