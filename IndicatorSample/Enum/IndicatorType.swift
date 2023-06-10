//
//  IndicatorType.swift
//  IndicatorSample
//
//  Created by 滝野翔平 on 2023/06/10.
//

import Foundation

enum IndicatorType {
    
    case hello
    case goodbye
    
    var displayTitle: String {
        switch self {
        case .hello: return "こんちは〜"
        case .goodbye: return "さいなら"
        }
    }
}
