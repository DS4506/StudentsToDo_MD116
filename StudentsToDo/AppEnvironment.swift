import SwiftUI

private struct AppAccentColorKey: EnvironmentKey {
    // Default accent color used if nothing else is injected.
    static let defaultValue: Color = .teal
}

extension EnvironmentValues {
    var appAccentColor: Color {
        get { self[AppAccentColorKey.self] }
        set { self[AppAccentColorKey.self] = newValue }
    }
}
