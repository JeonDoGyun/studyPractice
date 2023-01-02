//
//  CustomView.swift
//  Xib-Starter
//
//  Created by 전도균 on 2022/12/19.
//

import UIKit

class CustomView: UIView {

    static let identifier = String(describing: CustomView.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiateXib()
    }
    
    
    private func instantiateXib() {
        let nib = UINib(nibName: CustomView.identifier, bundle: nil)
        guard let viewFromXib = nib.instantiate(withOwner: self).first as? UIView else { fatalError() }
        addSubview(viewFromXib)
        viewFromXib.frame = bounds
        backgroundColor = .red
    }

}
