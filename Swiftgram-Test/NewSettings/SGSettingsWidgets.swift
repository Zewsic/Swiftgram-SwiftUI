//
//  SGSettingsWidgets.swift
//  Swiftgram-Test
//
//  Created by Zewsic on 03.05.2025.
//

import SwiftUI
import SceneKit

struct SFXSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let particles: String
    let model: String
    let title: String
    let subtitle: String
    let content: AnyView
    
    private var adaptiveBackground: Color {
        Color(colorScheme == .dark
              ? UIColor.systemBackground
              : UIColor.secondarySystemBackground)
    }

    var body: some View {
        ZStack {
            adaptiveBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SceneKitView(sceneName: particles, allowsCameraControl: false)
                    .padding(.top, 20)
                    .frame(height: 220)
                Spacer()
            }.edgesIgnoringSafeArea(.top)
            
            VStack {
                SceneKitView(sceneName: model, allowsCameraControl: true)
                    .padding(.top, 15)
                    .frame(height: 220)
                Spacer()
            }.edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 0) {
                Spacer().frame(height: 80)
                
                Text(title)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 20)
                
                Text(subtitle)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 20)
                
                content
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity,
                           alignment: .top)
            }
        }
    }
}

struct SettingsScreen: View {
    let title: String
    let description: String?
    
    let imageName: String?
    let systemName: String?
    let color: Color
    let smallerIcon: Bool
    
    let content: AnyView
    
    let useDesctiptionWidget: Bool
    
    init(title: String, description: String? = nil, imageName: String? = nil, systemName: String? = nil, color: Color = .gray, smallerIcon: Bool = false, content: AnyView) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.systemName = systemName
        self.color = color
        self.smallerIcon = smallerIcon
        self.content = content
        self.useDesctiptionWidget = (description != nil && (imageName != nil || systemName != nil))
    }
    
    var body: some View {
        Form {
            if (useDesctiptionWidget) {
                Section {
                    VStack(spacing: 10) {
                        HStack {
                            Spacer()
                            if systemName != nil {
                                Image(systemName: systemName!)
                                    .font(.system(size: smallerIcon ? 35 : 40))
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 60)
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                            .fill(color)
                                    )
                                    .accessibility(hidden: true)
                            } else if imageName != nil {
                                Image(imageName!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    )
                                    .accessibility(hidden: true)
                            }
                            Spacer()
                        }
                        Text(title)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        
                        Text(description!)
                            .multilineTextAlignment(.center)
                            .font(.callout)
                    }.padding(.vertical, 15)
                }
            }
            
            content
        }.navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct SettingsRow: View {
    let title: String
    let systemName: String?
    let color: Color?
    let smallerIcon: Bool
    let imageName: String?
    let selectedValue: String?
    
    init(title: String, systemName: String? = nil, color: Color? = nil, smallerIcon: Bool = false, imageName: String? = nil, selectedValue: String? = nil) {
        self.title = title
        self.systemName = systemName
        self.color = color
        self.smallerIcon = smallerIcon
        self.imageName = imageName
        self.selectedValue = selectedValue
    }
    
    var body: some View {
        HStack(spacing: 15) {
            if (systemName != nil && color != nil) {
                SettingsIcon(systemName: systemName!, background: color!, smaller: smallerIcon)
            } else if (imageName != nil) {
                SettingsImageIcon(name: imageName!)
            }
            Text(title)
            Spacer()
            if selectedValue != nil {
                Text(selectedValue!)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SettingsIcon: View {
    let systemName: String
    let background: Color
    let smaller: Bool
    
    init(systemName: String, background: Color, smaller: Bool = false) {
        self.systemName = systemName
        self.background = background
        self.smaller = smaller
    }
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: smaller ? 15 : 17, weight: .semibold))
            .foregroundColor(.white)
            .frame(width: 29, height: 29)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(background)
            )
            .accessibility(hidden: true)
    }
}

struct SettingsImageIcon: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 29, height: 29)
            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
            )
            .accessibility(hidden: true)
    }
}


struct SceneKitView: UIViewRepresentable {
    let sceneName: String
    let allowsCameraControl: Bool
    
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        
        if let scene = SCNScene(named: "\(sceneName).scn") {
            scnView.scene = scene
            
            scene.rootNode.enumerateChildNodes { (node, _) in
                if node.animationKeys.isEmpty == false {
                    node.isPaused = false
                }
            }
        }
        
        scnView.allowsCameraControl = allowsCameraControl
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = .clear
        scnView.loops = true
        
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}

extension Color {
    static let livelyMint = Color(hue: 0.48, saturation: 0.5, brightness: 0.9)
    static let coralBreeze = Color(hue: 0.0, saturation: 0.6, brightness: 0.95)
    static let aquaGlow = Color(hue: 0.5, saturation: 0.45, brightness: 0.95)
    static let lilacBloom = Color(hue: 0.75, saturation: 0.45, brightness: 0.9)
    static let goldenHaze = Color(hue: 0.14, saturation: 0.5, brightness: 0.95)
    static let indigoMist = Color(hue: 0.67, saturation: 0.5, brightness: 0.85)
    static let rosyBlush = Color(hue: 0.92, saturation: 0.5, brightness: 0.95)
    static let oliveGlow = Color(hue: 0.33, saturation: 0.4, brightness: 0.9)
    static let warmSand = Color(hue: 0.1, saturation: 0.35, brightness: 0.9)
    static let skyBreeze = Color(hue: 0.58, saturation: 0.4, brightness: 0.95)
    static let peachBloom = Color(hue: 0.05, saturation: 0.5, brightness: 0.95)
    static let creamGlow = Color(hue: 0.08, saturation: 0.3, brightness: 0.95)
}

struct SettingsSelectorScreen: View {
    let title: String
    let options: [String]
    let descriptions: [String]
    let defaultDescription: String
    let allowNilSelection: Bool
    
    let onSelect: ((Int?) -> Void)
    
    init(title: String, options: [String], descriptions: [String] = [], defaultDescription: String = "", allowNilSelection: Bool = false, selectedIndex: Int? = nil, onSelect: @escaping ((Int?) -> Void) = {_ in}) {
        self.title = title
        self.options = options
        self.descriptions = descriptions
        self.defaultDescription = defaultDescription
        self.allowNilSelection = allowNilSelection
        self.selectedIndex = selectedIndex
        self.onSelect = onSelect
    }
    
    @State var selectedIndex: Int? = nil
    
    
    var body: some View {
        return Form {
                Section(footer: Text(getDescription())) {
                    List {
                        ForEach(0..<options.count) { index in
                            HStack {
                                Text(options[index])
                                Spacer()
                                if selectedIndex == index {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                            .contentShape(Rectangle()) // делаем всю строку кликабельной
                            .onTapGesture {
                                if index == selectedIndex && allowNilSelection {
                                    selectedIndex = nil
                                } else {
                                    selectedIndex = index
                                }
                                onSelect(selectedIndex)
                            }
                        }
                    }
                    .navigationBarTitle(Text(title), displayMode: .inline)
                }
            }
    }
    
    func getDescription() -> String {
        if selectedIndex == nil {
            return defaultDescription
        } else if selectedIndex! > descriptions.count {
            return defaultDescription
        }
        return descriptions[selectedIndex!]
    }
}



#Preview {
    SettingsSelectorScreen(title: "Settings",
                           options: ["Разрешить", "Спрашивать", "Запретить"],
                           descriptions: ["Будет разрешено", "Будет запрещено", "Не будет запрещено"],
                           defaultDescription: "срать",
                           allowNilSelection: true,
                           onSelect: {index in print("Selected: \(index)")})
}
