//
//  detalleRow.swift
//  SubteBA
//
//  Created by Guadalupe Vlcek on 29/5/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//


import Foundation
import UIKit
import WatchKit


class detalle: WKInterfaceController {
    
    @IBOutlet var ImageDetalle: WKInterfaceImage!
    
    @IBOutlet var labelDetalle: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let valor = context as! [String]
        self.ImageDetalle.setImage(UIImage(named:valor[0]))
        self.labelDetalle.setText(valor[1])
        setTitle(valor[2])
    }
    
}