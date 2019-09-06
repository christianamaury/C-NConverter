//
//  RoundButton.swift
//  News & Currency Converter
//
//  Created by cysparrow on 8/15/19.
//  Copyright © 2019 SweetestProductionsLLC. All rights reserved.
//

import Foundation
import UIKit

class RoundButton: UIButton
{
    //Overriding UIButton frame..
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        //Call your custom button
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init (coder: aDecoder)
        
        //Call it again..
    }
    
    //Setting up the custom button..
    private func setupButton()
    {
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(red: 255/255, green: 5/255, blue: 40/255, alpha: 0)
        titleLabel?.font = .boldSystemFont(ofSize: 20)
        layer.cornerRadius = frame.size.height / 2
    }
}
