import SwiftUI

class StoreManager: ObservableObject {
    @Published var isPro = false
    
    /// Simulates buying the Pro version.
    /// In a real app this is where StoreKit / App Store logic would live.
    func buyProVersion() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.isPro = true
        }
    }
    
    /// Returns true if the user is allowed to add a new group.
    /// Free users are limited to 3 groups, Pro users have no limit.
    func canAddGroup(currentGroupCount: Int) -> Bool {
        if isPro {
            return true
        } else {
            return currentGroupCount < 3
        }
    }
}
