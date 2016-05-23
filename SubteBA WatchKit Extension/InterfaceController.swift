//
//  InterfaceController.swift
//  SubteBA WatchKit Extension
//
//  Created by Guadalupe Vlcek on 18/5/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var estadoTable: WKInterfaceTable!
    
    @IBAction func recargar() {
        buscaDatos()
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        buscaDatos()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func buscaDatos() {
        // Configure interface objects here.
        let lineas = ["lineaA", "lineaB", "lineaC", "lineaD", "lineaE", "lineaH", "lineaP"]
        var estados = ["","","","","","",""]
        
        self.estadoTable.setNumberOfRows((lineas.count), withRowType: "estadoRow")
        
        let url = NSURL(string: "http://www.metrovias.com.ar")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            let urlcontent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
            
            
            //OBTENGO LINEA A
            let aStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-A\">")
            
            let auxiliarA = aStatusRaw[1].componentsSeparatedByString("<")
            estados[0] = auxiliarA[0]
            
            //OBTENGO LINEA B
            
            let bStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-B\">")
            
            let auxiliarB = bStatusRaw[1].componentsSeparatedByString("<")
            estados[1] = auxiliarB[0]
            
            //OBTENGO LINEA C
            
            let cStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-C\">")
            
            let auxiliarC = cStatusRaw[1].componentsSeparatedByString("<")
            estados[2] = auxiliarC[0]
            
            //OBTENGO LINEA D
            
            let dStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-D\">")
            
            let auxiliarD = dStatusRaw[1].componentsSeparatedByString("<")
            estados[3] = auxiliarD[0]
            
            //OBTENGO LINEA E
            
            let eStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-E\">")
            
            let auxiliarE = eStatusRaw[1].componentsSeparatedByString("<")
            estados[4] = auxiliarE[0]
            
            //OBTENGO LINEA H
            
            let hStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-H\">")
            
            let auxiliarH = hStatusRaw[1].componentsSeparatedByString("<")
            estados[5] = auxiliarH[0]
            
            //OBTENGO LINEA PREMETRO
            
            let pStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-P\">")
            
            let auxiliarP = pStatusRaw[1].componentsSeparatedByString("<")
            estados[6] = auxiliarP[0]
            
            //print(estados)
            
            for index in 0..<estados.count {
                let theRow = self.estadoTable.rowControllerAtIndex(index) as! estadoRow
                theRow.self.estadoLabel.setText(estados[index])
                theRow.self.estadoImage.setImage(UIImage(named:lineas[index]))
            }
            
        }
        task.resume()
    }

}
