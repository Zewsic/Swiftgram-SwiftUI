//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct ProfilesSettingsView: View {
    @State var showUserID: Bool { didSet {
        
    }}
    @State var showUserDC: Bool { didSet {
        
    }}
    @State var showUserRegistrationDate: Bool { didSet {
        
    }}
    @State var showChatCreationDate: Bool { didSet {
        
    }}
    @State var askBeforeCall: Bool { didSet {
        
    }}
    @State var hideNumber: Bool { didSet {
        
    }}
    
    init() {
        self._showUserID = State(initialValue: true)
        self._showUserDC = State(initialValue: true)
        self._showUserRegistrationDate = State(initialValue: true)
        self._showChatCreationDate = State(initialValue: false)
        self._askBeforeCall = State(initialValue: true)
        self._hideNumber = State(initialValue: false)
    }
    
    var body: some View {
        SettingsScreen(title: "Профили",
                       description: "Настройте отображение элементов профиля пользователей.",
                       systemName: "person.crop.circle",
                       color: .coralBreeze,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            Section(footer: Text("Дата регистрации определяется приблизительно. **Используются облачные технологии.**")) {
                Toggle(isOn: $showUserID) {
                    SettingsRow(title: "Отображать ID (Bot API)")
                }
                Toggle(isOn: $showUserDC) {
                    SettingsRow(title: "Отображать дата-центр (DC)")
                }
                Toggle(isOn: $showUserRegistrationDate) {
                    SettingsRow(title: "Отображать дату регистрации")
                }
            }
            
            Section(footer: Text("Может быть неизвестна для некоторых чатов.")) {
                Toggle(isOn: $showChatCreationDate) {
                    SettingsRow(title: "Показать дату создания чата")
                }
            }
            
            Section(footer: Text("Предотвращает случайные звонки.")) {
                Toggle(isOn: $askBeforeCall) {
                    SettingsRow(title: "Спрашивать перед звонком")
                }
            }
            
            Section(footer: Text("Скрывает ваш номер телефона в приложении.")) {
                Toggle(isOn: $askBeforeCall) {
                    SettingsRow(title: "Скрыть номер телефона")
                }
            }
            
        }
    }
    
}

#Preview {
    ProfilesSettingsView()
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

