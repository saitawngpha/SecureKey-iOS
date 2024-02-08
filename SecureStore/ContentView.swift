//
//  ContentView.swift
//  SecureStore
//
//  Created by Steve Pha on 05/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var secureViewModel = SecureViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing ) {
              Form {
                Section {
                    SecureField("Api Key", text: $secureViewModel.inputApiKey)
                }
                header: {
                  Text("OpenAI Secrets")
                }
                footer: {
                  Text("these data will be stored in onboard secure keychain")
                }
              }
              HStack {
                Button( action: { secureViewModel.resetSettings() },
                label: {
                  Label( "Clear", systemImage: "xmark")
                })
                Button( action: { secureViewModel.commitSettings() },
                label: {
                  Label( "Submit", systemImage: "arrow.right")
                })
                .disabled( secureViewModel.inputApiKey.isEmpty )
              }
              .padding()
        }
    }
}

#Preview {
    ContentView()
}
