import SwiftUI

@main
struct StudentsToDoApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.locale) private var locale
    @StateObject private var storeManager = StoreManager()
    
    /// Accent color that adapts to the active language.
    /// - Arabic: brown
    /// - Spanish: orange
    /// - All others: teal
    private var dynamicAccentColor: Color {
        switch locale.language.languageCode?.identifier {
        case "ar":
            return .brown
        case "es":
            return .orange
        default:
            return .teal
        }
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.appAccentColor, dynamicAccentColor)
                .environmentObject(storeManager)
        }
    }
}
