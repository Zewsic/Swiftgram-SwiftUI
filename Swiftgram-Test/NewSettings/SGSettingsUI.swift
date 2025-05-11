//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct NewSettingsView: View {
    var body: some View {
        SFXSettingsView(
            particles: "particles",
            model: "lightning",
            title: "Swiftgram 11.10",
            subtitle: "Заряженный Telegram-клиент с дополнительным функционалом.",
            content: content as! AnyView
        )
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            Form {
                Section(header: Text("Настройки")) {
                    NavigationLink(destination: GeneralSettingsView()) {
                        SettingsRow(title: "Основные",
                                    systemName: "slider.horizontal.3",
                                    color: .blue)
                    }
                    
                    NavigationLink(destination: InterfaceSettingsView()) {
                        SettingsRow(title: "Интерфейс",
                                    systemName: "square.3.stack.3d",
                                    color: .purple)
                    }
                    
                    NavigationLink(destination: Text("Appearance")) {
                        SettingsRow(title: "Сообщения и чаты",
                                    systemName: "message.fill",
                                    color: .green)
                    }
                    
                    NavigationLink(destination: Text("Other")) {
                        SettingsRow(title: "Прочее",
                                    systemName: "circle.grid.2x2",
                                    color: .coralBreeze)
                    }
                }
                
                Section(header: Text("Дополнительно")) {
                    NavigationLink(destination: NewSGProView()) {
                        SettingsRow(title: "Swiftgram Pro", imageName: "SwiftgramPro")
                    }
                }
            }
        }
    }
    
    
    
}

#Preview {

    NavigationView {
        NewSettingsView()
            .navigationBarTitle(Text(" ."), displayMode: .inline)
    }
}

