//
//  SecureViewModel.swift
//  SecureStore
//
//  Created by Steve Pha on 05/02/2024.
//

import SwiftUI

class SecureViewModel : ObservableObject {

  @AppSecureStorage("openaikey") private var openAIKey:String?
  @Published public var inputApiKey = ""

  init() {
    inputApiKey = openAIKey ?? ""
  }

  func commitSettings() {
    guard !inputApiKey.isEmpty else {
      return
    }
    openAIKey = inputApiKey
  }

  func resetSettings() {
    inputApiKey = ""
    openAIKey = nil
  }

}
