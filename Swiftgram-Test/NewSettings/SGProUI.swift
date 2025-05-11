//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct NewSGProView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var adaptiveBackground: Color {
        Color(colorScheme == .dark
              ? UIColor.systemBackground
              : UIColor.secondarySystemBackground)
    }
    
    var body: some View {
        SFXSettingsView(
            particles: "particles_pro",
            model: "lightning_pro",
            title: "Swiftgram Pro",
            subtitle: "Благодорим за оформление подписки Swiftgram Pro. Теперь вам доступны следующие функции:",
            content: content as! AnyView
        )
    }
    
    var content: some View {
        VStack(spacing: 0) {            
            Form {
                Section(header: Text("Основные")) {
                    NavigationLink(destination: Text("Accounts Backup")) {
                        SettingsRow(title: "Резервное копирование",
                                    systemName: "archivebox.fill",
                                    color: .gray)
                    }
                    
                    NavigationLink(destination: Text("Messages Filter")) {
                        SettingsRow(title: "Фильтр сообщений",
                                    systemName: "nosign",
                                    color: .red)
                    }
                    
                    Toggle(isOn: Binding(get: {true}, set: {_ in})) {
                        SettingsRow(title: "Панель форматирования",
                                    systemName: "textformat",
                                    color: .blue)
                    }
                }
                
                Section(header: Text("Уведомления")) {
                    NavigationLink(destination: Text("Закрепленные сообщения")) {
                        SettingsRow(title: "Закрепленные сообщения",
                                    systemName: "pin.slash.fill",
                                    color: .orange)
                    }
                    
                    NavigationLink(destination: Text("Mentions and replies")) {
                        SettingsRow(title: "Упоминания и ответы",
                                    systemName: "at",
                                    color: .purple,
                                    smallerIcon: false)
                    }
                }
                
                Section(header: Text("Оформление")) {
                    NavigationLink(destination: Text("App Icons")) {
                        SettingsRow(title: "Иконка приложения",
                                    imageName: "AppIcon")
                    }
                    
                    NavigationLink(destination: Text("App Badges")) {
                        SettingsRow(title: "Бэйдж приложения",
                                    imageName: "AppBadge")
                    }
                }
            }
        }
    }
    
    private func settingsRow(title: String,
                             systemName: String,
                             color: Color) -> some View {
        HStack(spacing: 15) {
            SettingsIcon(systemName: systemName,
                         background: color)
            Text(title)
        }
        
    }
}


#Preview {
    NavigationView {
        NewSGProView()
            .navigationBarTitle(Text(" ."), displayMode: .inline)
    }
//    NavigationView {
//        NavigationLink {
//            NewSettingsView()
//        } label: {
//            Text("Swiftgram")
//        }
//    }
}
    
