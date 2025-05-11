//
//  Settings.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 02.05.2025.
//

import SwiftUI
import Foundation

struct FoldersSettingsView: View {
    @State var showAllChatsFolder: Bool { didSet {
        
    }}
    @State var allChatsFolderName: String? { didSet {
        
    }}
    @State var foldersInBottom: Bool { didSet {
        
    }}
    @State var useNativeFoldersStyle: Bool { didSet {
        
    }}
    @State var shortenSize: Bool { didSet {
        
    }}
    @State var alwaysOpenLastFolder: Bool { didSet {
        
    }}
    
    init() {
        self._showAllChatsFolder = State(initialValue: true)
        self._allChatsFolderName = State(initialValue: nil)
        self._foldersInBottom = State(initialValue: true)
        self._useNativeFoldersStyle = State(initialValue: false)
        self._shortenSize = State(initialValue: false)
        self._alwaysOpenLastFolder = State(initialValue: false)
    }
    
    var body: some View {
        SettingsScreen(title: "Папки с чатами",
                       description: "Используя папки, вы можете группировать чаты и управлять их порядком.",
                       systemName: "folder.fill",
                       color: .indigoMist,
                       smallerIcon: true,
                       content: content as! AnyView)
    }
    
    private var content: some View {
        Group {
            Section(header: Text("Папка \"Все чаты\""), footer: Text(showAllChatsFolder ? "Вы можете установить любое название для этой папки." : "")) {
                Toggle(isOn: $showAllChatsFolder) {
                    SettingsRow(title: "Включить папку")
                }
                if showAllChatsFolder {
                    NavigationLink{
                        
                    } label: {
                        SettingsRow(title: "Название папки", selectedValue: allChatsFolderName != nil ? allChatsFolderName : "По умолчанию")
                    }
                }
            }
            
            Section(header: Text("Оформленеие"), footer: Text("Папки будут занимать меньше места на экране.")) {
                Toggle(isOn: $foldersInBottom) {
                    SettingsRow(title: "Показывать папки снизу")
                }
                NavigationLink{
                    
                } label: {
                    SettingsRow(title: "Стиль папок", selectedValue: useNativeFoldersStyle ? "iOS" : "Telegram")
                }
                Toggle(isOn: $shortenSize) {
                    SettingsRow(title: "Уменьшенные расстояния")
                }
            }
            
            Section(footer: Text("Swiftgram будет открывать посленюю использованную папку после перезапуска или смены аккаунта.")) {
                Toggle(isOn: $shortenSize) {
                    SettingsRow(title: "Открывать последнюю папку")
                }
            }
            
        }
    }
    
}

#Preview {
    NavigationView {
        FoldersSettingsView()
    }
    //        NavigationView {
    //            NavigationLink {
    //                NewSettingsView()
    //            } label: {
    //                Text("Swiftgram")
    //            }
    //        }
}

