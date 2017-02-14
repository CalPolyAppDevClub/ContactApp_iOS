//
//  Extensions.swift
//  ContactApp
//
//  Created by Joe Durand on 8/27/16.
//  Copyright © 2016 Cal Poly App Dev. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public class func instantiateFromNib<T: UIView>(_ viewType: T.Type) -> T {
        return Bundle.main.loadNibNamed(String(describing: viewType), owner: nil, options: nil)!.first as! T
    }
    
    public class func instantiateFromNib() -> Self {
        return instantiateFromNib(self)
    }
    
}
