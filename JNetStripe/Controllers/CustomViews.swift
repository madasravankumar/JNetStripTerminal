//
//  CustomViews.swift
//  JNetStripe
//
//  Created by sravan on 11/03/19.
//  Copyright © 2019 jnet. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorHeaderView: UIView {
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    var title: String {
        didSet {
            label.text = title.uppercased()
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.textColor = UIColor(red: 0.42, green: 0.42, blue: 0.44, alpha: 1.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        label.text = title.uppercased()
        let stack = UIStackView(arrangedSubviews: [
            label,
            activityIndicator,
            ])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        let insets = UIEdgeInsets(top: 14, left: 16, bottom: 6, right: 16)
        if #available(iOS 11.0, *) {
            stack.anchor(to: safeAreaLayoutGuide, withInsets: insets)
        } else {
            stack.anchorToSuperviewAnchors(withInsets: insets)
        }
        
        bounds.size.height = 50
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
