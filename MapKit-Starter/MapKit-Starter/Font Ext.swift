//
//  Font Ext.swift
//  MapKit-Starter
//
//  Created by 전도균 on 2022/09/26.
//

import Foundation

extension vie {

    static func swizzle() {
        method_exchangeImplementations(
                class_getInstanceMethod(self, #selector(getter: ascender))!,
                class_getInstanceMethod(self, #selector(getter: swizzledAscender))!
        )
        method_exchangeImplementations(
                class_getInstanceMethod(self, #selector(getter: lineHeight))!,
                class_getInstanceMethod(self, #selector(getter: swizzledLineHeight))!
        )
    }

    private var isHiragino: Bool {
        fontName.contains("Hiragino")
    }

    @objc private var swizzledAscender: CGFloat {
        if isHiragino {
            return self.swizzledAscender * 1.15
        } else {
            return self.swizzledAscender
        }
    }

    @objc private var swizzledLineHeight: CGFloat {
        if isHiragino {
            return self.swizzledLineHeight * 1.25
        } else {
            return self.swizzledLineHeight
        }
    }

}
