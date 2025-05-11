//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct GesturesSettingsView: View {
    @State var enablePIP: Bool { didSet {
        
    }}
    @State var enableEditDoubleTap: Bool { didSet {
        
    }}
    @State var enableSwipeBetweenChannels: Bool { didSet {
        
    }}
    @State var enableSwipeBetweenTopics: Bool { didSet {
        
    }}
    @State var sendViaEnter: Bool { didSet {
        
    }}
    
    init() {
        self._enablePIP = State(initialValue: true)
        self._enableEditDoubleTap = State(initialValue: false)
        self._enableSwipeBetweenChannels = State(initialValue: true)
        self._enableSwipeBetweenTopics = State(initialValue: false)
        self._sendViaEnter = State(initialValue: false)
    }
    
    var body: some View {
        SettingsScreen(title: "Жесты",
                       description: "Сделайте использование Swiftgram еще более удобным с жестами!",
                       systemName: "hand.point.up.fill",
                       color: .blue,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            Section(footer: Text("Переводить видео в режим **картинка в картинке** при свайпе вверх.")) {
                Toggle(isOn: $enablePIP) {
                    SettingsRow(title: "Свайп для PIP")
                }
            }
            
            Section(footer: Text("Позволяет редактировать сообщение после двойного нажатия по нему.")) {
                Toggle(isOn: $enableEditDoubleTap) {
                    SettingsRow(title: "Дабл-тап для редактирования")
                }
            }
            
            Section(footer: Text("Позволяет быстро переключаться между непрочитанными каналами, или топиками.")) {
                Toggle(isOn: $enableSwipeBetweenChannels) {
                    SettingsRow(title: "Свайп между каналами")
                }
                Toggle(isOn: $enableSwipeBetweenTopics) {
                    SettingsRow(title: "Свайп между топиками")
                }
            }
            
            Section(footer: Text("Отправляет сообщение при нажатии на \"Ввод\", вместо переноса строки.")) {
                Toggle(isOn: $enableEditDoubleTap) {
                    SettingsRow(title: "Отправка кнопкой \"Ввод\"")
                }
            }
        }
    }
    
}

#Preview {
    GesturesSettingsView()
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

