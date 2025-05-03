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
                        settingsRow(title: "Резервное копирование",
                                    systemName: "key.fill",
                                    color: .gray)
                    }
                    
                    NavigationLink(destination: Text("Messages Filter")) {
                        settingsRow(title: "Фильтр сообщений",
                                    systemName: "nosign",
                                    color: .red)
                    }
                    
                    Toggle(isOn: Binding(get: {true}, set: {_ in})) {
                        HStack(spacing: 15) {
                            SettingsIcon(systemName: "textformat",  background: .blue)
                            Text("Панель форматирования")
                        }
                    }
                }
                
                Section(header: Text("Уведомления")) {
                    NavigationLink(destination: Text("Закрепленные сообщения")) {
                        settingsRow(title: "Закрепленные сообщения",
                                    systemName: "pin.fill",
                                    color: .orange)
                    }
                    
                    NavigationLink(destination: Text("Mentions and replies")) {
                        settingsRow(title: "Упоминания и ответы",
                                    systemName: "arrowshape.turn.up.left.fill",
                                    color: .purple)
                    }
                }
                
                Section(header: Text("Оформление")) {
                    NavigationLink(destination: Text("App Icons")) {
                        settingsRow(title: "Иконка приложения",
                                    systemName: "app.fill",
                                    color: .pink)
                    }
                    
                    NavigationLink(destination: Text("App Badges")) {
                        settingsRow(title: "Бэйдж приложения",
                                    systemName: "app.dashed",
                                    color: .gray)
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
    }
//    NavigationView {
//        NavigationLink {
//            NewSettingsView()
//        } label: {
//            Text("Swiftgram")
//        }
//    }
}
    
