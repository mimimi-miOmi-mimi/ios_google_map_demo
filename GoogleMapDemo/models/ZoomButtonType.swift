import Foundation
import SwiftUI

enum ZoommButtonType {
    case plus
    case minus

    var imageName: String {
        switch self {
        case .plus:
            return "plus.circle.fill"
        case .minus:
            return "minus.circle.fill"
        }
    }
}
