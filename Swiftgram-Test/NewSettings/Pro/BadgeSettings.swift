import SwiftUI
import Foundation

struct Badge: Identifiable, Hashable {
    let id: UUID = .init()
    let displayName: String
    let assetName: String
}

let badges: [Badge] = [
    .init(displayName: "Swiftgram", assetName: "swiftgram"),
    .init(displayName: "Telegram",   assetName: "telegram"),
    .init(displayName: "Code Red",   assetName: "code_red"),
    .init(displayName: "Silver",   assetName: "silver"),
    .init(displayName: "Russian",   assetName: "russian"),
    .init(displayName: "None",   assetName: "none"),
]

private enum Layout {
    static let cardCorner: CGFloat = 12
    static let imageHeight: CGFloat = 56
    static let columnSpacing: CGFloat = 16
    static let horizontalPadding: CGFloat = 20
}

@available(iOS 14.0, *)
struct BadgeSettingsView: View {
    @State var selectedBadge: String { didSet {
        
    }}
    
    init() {
        self._selectedBadge = State(initialValue: "swiftgram")
    }
    
    var body: some View {
            ZStack {
                adaptiveBackground.ignoresSafeArea(.all)
                ScrollView {
                    Section {
                        VStack(spacing: 10) {
                            HStack {
                                Spacer()
                                Image("AppBadge")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                    .background(
                                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    )
                                    .accessibility(hidden: true)
                                Spacer()
                            }
                            Text("Бэйдж приложения")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                            
                            Text("Выберите один из предложенных дизайнов для бэйджа, или вовсе отключите его.")
                                .multilineTextAlignment(.center)
                                .font(.callout)
                        }
                        .padding(.vertical, 25)
                        .padding(.horizontal, 15)
                    }
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color(.systemBackground)))
                    .padding(20)
                    
                    LazyVGrid(columns: columns, alignment: .center, spacing: Layout.columnSpacing) {
                        ForEach(badges) { badge in
                            Button {
                                
                            } label: {
                                VStack(spacing: 8) {
                                    Image(badge.assetName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: Layout.imageHeight)
                                        .accessibilityHidden(true)
                                    
                                    Text(badge.displayName)
                                        .font(.body)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(colorScheme == .dark ? .secondarySystemBackground : .systemBackground))
                                .cornerRadius(Layout.cardCorner)
                                .overlay(
                                    RoundedRectangle(cornerRadius: Layout.cardCorner)
                                        .stroke(selectedBadge == badge.assetName ? Color.accentColor : Color.clear, lineWidth: 2)
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, Layout.horizontalPadding)
                    .padding(.vertical, 10)
                }
                .navigationBarTitle(Text("Бэйдж приложения"), displayMode: .inline)

        }
    }
    
    private var columns: [SwiftUI.GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: Layout.columnSpacing), count: 2)
    }
    
    @Environment(\.colorScheme) var colorScheme
    private var adaptiveBackground: Color {
        Color(colorScheme == .dark
              ? UIColor.systemBackground
              : UIColor.secondarySystemBackground)
    }
}

#Preview {
    if #available(iOS 14.0, *) {
        BadgeSettingsView()
    } else {
        // Fallback on earlier versions
    }
}

