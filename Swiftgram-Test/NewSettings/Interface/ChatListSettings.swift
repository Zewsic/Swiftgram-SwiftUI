//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct ChatListSettings: View {
    @State var miniChatList: Bool { didSet {
        
    }}
    @State var showSwipeOptions: Bool { didSet {
        
    }}
    @State var swipeToRemoveChat: Bool { didSet {
        
    }}
    
    init() {
        self._miniChatList = State(initialValue: false)
        self._showSwipeOptions = State(initialValue: true)
        self._swipeToRemoveChat = State(initialValue: true)
    }
    
    var body: some View {
        SettingsScreen(title: "Список чатов",
                       description: "Список чатов - первое что вы видите при запуске приложения.",
                       systemName: "message.fill",
                       color: .green,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            Section(header: Text("Оформление")) {
                Toggle(isOn: $miniChatList) {
                    SettingsRow(title: "Компактный список чатов")
                }
            }
            
            Section(header: Text("Свайпы"), footer: Text("Свайпы могут быть использованы для прочтения, закрепления, архивации или удаления чата.")) {
                Toggle(isOn: $swipeToRemoveChat) {
                    SettingsRow(title: "Свайп для удаления")
                }
                Toggle(isOn: $showSwipeOptions) {
                    SettingsRow(title: "Другие опции")
                }
            }
        }
    }
    
}

#Preview {
    ChatListSettings()
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

