//
//  NavigationPath.swift
//  Week2_Cupang
//
//  Created by MaraMincho on 7/9/24.
//

import Foundation
import Combine

enum NavigationPath {
  case itemList
  case detail
}


final class NavigationPathPublisher {
  private init() {}
  private static let _publisher: PassthroughSubject<NavigationPath, Never> = .init()
  static func send(_ path: NavigationPath) {
    _publisher.send(path)
  }
  static func publisher() -> AnyPublisher<NavigationPath, Never> {
    _publisher.eraseToAnyPublisher()
  }
}
