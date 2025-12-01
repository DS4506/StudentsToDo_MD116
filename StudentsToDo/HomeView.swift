import SwiftUI

struct HomeView: View {
    @Environment(\.appAccentColor) private var appAccentColor
    
    private let profiles: [ProfileCategory] = [
        ProfileCategory(name: "School",   imageName: "SchoolCover",   storageKey: "school_data"),
        ProfileCategory(name: "Work",     imageName: "WorkCover",     storageKey: "work_data"),
        ProfileCategory(name: "Personal", imageName: "PersonalCover", storageKey: "personal_data")
    ]
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    header
                    profileGrid
                }
                .padding()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var header: some View {
        VStack(spacing: 8) {
            Image(systemName: "checklist")
                .font(.system(size: 60))
                .foregroundStyle(appAccentColor)
            
            Text("Students To-Do")
                .font(.largeTitle.bold())
            
            Text("Pick a workspace to manage its tasks.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 16)
    }
    
    private var profileGrid: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(profiles) { profile in
                NavigationLink {
                    ContentView(
                        storageKey: profile.storageKey,
                        profileTitle: profile.name
                    )
                } label: {
                    ProfileCard(profile: profile)
                }
                .buttonStyle(.plain)
                .accessibilityIdentifier(profile.storageKey)
            }
        }
        .padding(.top, 8)
    }
}

struct ProfileCard: View {
    let profile: ProfileCategory
    @Environment(\.appAccentColor) private var appAccentColor
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(profile.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .clipped()
                .overlay(alignment: .topLeading) {
                    Text(profile.name)
                        .font(.headline.bold())
                        .padding(8)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(8)
                }
            
            HStack {
                Image(systemName: "square.and.pencil")
                    .foregroundStyle(appAccentColor)
                Text("Open tasks")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
    }
}
