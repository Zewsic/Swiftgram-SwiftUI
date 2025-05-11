//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct NewSGProView: View {
    @State var enableFormattingPanel: Bool { didSet {
        
    }}
    @State var pinnedNotificationsMode: Int { didSet {
        
    }}
    @State var mentionNotificationsMode: Int { didSet {
        
    }}
    
    @State var showBadgeSettings: Bool = false
    
    
    init() {
        self._enableFormattingPanel = State(initialValue: true)
        self._pinnedNotificationsMode = State(initialValue: 0)
        self._mentionNotificationsMode = State(initialValue: 0)
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
                    
                    Toggle(isOn: $enableFormattingPanel) {
                        SettingsRow(title: "Формат-панель",
                                    systemName: "textformat",
                                    color: .blue)
                    }
                }
                
                Section(header: Text("Уведомления")) {
                    NavigationLink(destination: SettingsSelectorScreen(
                        title: "Закрепленные сообщения",
                        options: ["По умолчанию", "Без звука", "Отключить"],
                        descriptions: [
                            "Вы будете получать уведомления о закрепленных сообщениях.",
                            "Вы не будете получать уведомления о закрепленных сообщениях.",
                            "Полное игнорирование закрепления сообщений."
                        ],
                        allowNilSelection: false,
                        selectedIndex: pinnedNotificationsMode,
                        onSelect: {index in pinnedNotificationsMode = index!})
                    ) {
                        SettingsRow(title: "Закрепленные сообщения",
                                    systemName: "pin.slash.fill",
                                    color: .orange)
                    }
                    
                    NavigationLink(destination: SettingsSelectorScreen(
                        title: "Упоминания и ответы",
                        options: ["По умолчанию", "Без звука", "Отключить"],
                        descriptions: [
                            "Вы будете получать уведомления, когда вас упоминают, или отвечают на ваши сообщения.",
                            "Вы не будете получать уведомления, когда вас упоминают, или отвечают на ваши сообщения.",
                            "Полное игнорирование ответов и упоминаний."
                        ],
                        allowNilSelection: false,
                        selectedIndex: pinnedNotificationsMode,
                        onSelect: {index in pinnedNotificationsMode = index!})
                    ) {
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
                    
                    NavigationLink {
                        if #available(iOS 14.0, *) {
                            BadgeSettingsView()
                        } else {
                            // Fallback on earlier versions
                        }
                    } label: {
                        SettingsRow(title: "Бэйдж приложения",
                                    imageName: "AppBadge")
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}


#Preview {
    NavigationView {
        NewSGProView()
            .navigationBarTitle(Text(" ."), displayMode: .inline)
    }
}
    
