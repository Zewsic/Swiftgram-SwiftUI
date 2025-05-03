//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct StoriesSettingsView: View {
    @State var hideStories: Bool { didSet {
        
    }}
    @State var disableStoriesSwipe: Bool { didSet {
        
    }}
    @State var askBeforeOpenStory: Bool { didSet {
        
    }}
    @State var enableRepostToStory: Bool { didSet {
        
    }}
    
    init() {
        self._hideStories = State(initialValue: false)
        self._disableStoriesSwipe = State(initialValue: true)
        self._askBeforeOpenStory = State(initialValue: true)
        self._enableRepostToStory = State(initialValue: false)
    }
    
    var body: some View {
        SettingsScreen(title: "Истории",
                       description: "Настройте поведение с историй, или отключите их отображение.",
                       systemName: "circle.dashed.inset.fill",
                       color: .orange,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            Section(footer: Text("Истории будут скрыты на главном экране, однако они будут доступны в профиле пользователя.")) {
                Toggle(isOn: $hideStories) {
                    SettingsRow(title: "Скрыть истории")
                }
            }
            
            Section(footer: Text("Отключает жест запуска камеры на главном экране.")) {
                Toggle(isOn: $disableStoriesSwipe) {
                    SettingsRow(title: "Отключить свайп для камеры")
                }
            }
            Section(footer: Text("Предотвращает случайное открытие историй.")) {
                Toggle(isOn: $askBeforeOpenStory) {
                    SettingsRow(title: "Спрашивать перед просмотром")
                }
            }
            
            Section(footer: Text("Позволяет делать репост сообщения из канала в историю.")) {
                Toggle(isOn: $enableRepostToStory) {
                    SettingsRow(title: "Кнопка репоста")
                }
            }
            
        }
    }
    
}

#Preview {
    StoriesSettingsView()
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

