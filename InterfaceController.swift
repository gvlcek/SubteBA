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
    
    let lineas = ["lineaA", "lineaB", "lineaC", "lineaD", "lineaE", "lineaH", "lineaP"]
    var estados = ["","","","","","",""]
    let titulos = ["Linea A", "Linea B", "Linea C", "Linea D", "Linea E", "Linea H", "Linea P"]
    
    @IBOutlet var estadoTable: WKInterfaceTable!
    
    @IBAction func recargar() {
        buscaDatos()
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        buscaDatos()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(estadoTable: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let  datos =  [lineas[rowIndex], estados[rowIndex], titulos[rowIndex]]
        self.pushControllerWithName("detalle", context: datos)
    }
    
    private func buscaDatos() {
        
        self.estadoTable.setNumberOfRows((lineas.count), withRowType: "estadoRow")
        
        let url = NSURL(string: "http://www.metrovias.com.ar")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            let urlcontent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
            
            
            //OBTENGO LINEA A
            let aStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-A\">")
            
            let auxiliarA = aStatusRaw[1].componentsSeparatedByString("<")
            self.estados[0] = auxiliarA[0]
            
            //OBTENGO LINEA B
            
            let bStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-B\">")
            
            let auxiliarB = bStatusRaw[1].componentsSeparatedByString("<")
            self.estados[1] = auxiliarB[0]
            
            //OBTENGO LINEA C
            
            let cStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-C\">")
            
            let auxiliarC = cStatusRaw[1].componentsSeparatedByString("<")
            self.estados[2] = auxiliarC[0]
            
            //OBTENGO LINEA D
            
            let dStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-D\">")
            
            let auxiliarD = dStatusRaw[1].componentsSeparatedByString("<")
            self.estados[3] = auxiliarD[0]
            
            //OBTENGO LINEA E
            
            let eStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-E\">")
            
            let auxiliarE = eStatusRaw[1].componentsSeparatedByString("<")
            self.estados[4] = auxiliarE[0]
            
            //OBTENGO LINEA H
            
            let hStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-H\">")
            
            let auxiliarH = hStatusRaw[1].componentsSeparatedByString("<")
            self.estados[5] = auxiliarH[0]
            
            //OBTENGO LINEA PREMETRO
            
            let pStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-P\">")
            
            let auxiliarP = pStatusRaw[1].componentsSeparatedByString("<")
            self.estados[6] = auxiliarP[0]
            
            //print(estados)
            
            for index in 0..<self.estados.count {
                let theRow = self.estadoTable.rowControllerAtIndex(index) as! estadoRow
                theRow.self.estadoLabel.setText(self.estados[index])
                theRow.self.estadoImage.setImage(UIImage(named:self.lineas[index]))
            }
            
        }
        task.resume()
    }

}

/*class InterfaceController: WKInterfaceController {
    
    let lineas = ["lineaA", "lineaB", "lineaC", "lineaD", "lineaE", "lineaH", "lineaP"]
    var estados = ["","","","","","",""]
    let titulos = ["Linea A", "Linea B", "Linea C", "Linea D", "Linea E", "Linea H", "Linea P"]
    
    @IBOutlet var estadoTable: WKInterfaceTable!
    
    @IBAction func recargar() {
        buscaDatos()
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        buscaDatos()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //buscaDatos()
        buscaDatos()
    }
    
    override func didDeactivate() {
        class InterfaceController: WKInterfaceController {
            super.didDeactivate()
        }
        
        override func table(estadoTable: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
            let  datos =  [lineas[rowIndex], estados[rowIndex], titulos[rowIndex]]
            self.pushControllerWithName("detalle", context: datos)
        }
        
            func buscaDatos() {
                // Configure interface objects here.
                
                //var estados = ["","","","","","",""]
                let lineas = ["lineaA", "lineaB", "lineaC", "lineaD", "lineaE", "lineaH", "lineaP"]
                var estados = ["","","","","","",""]
                
                self.estadoTable.setNumberOfRows((lineas.count), withRowType: "estadoRow")
                
                class InterfaceController: WKInterfaceController {
                    let aStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-A\">")
                    
                    let auxiliarA = aStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[0] = auxiliarA[0]
                    estados[0] = auxiliarA[0]
                    
                    //OBTENGO LINEA B
                    
                    let bStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-B\">")
                    
                    let auxiliarB = bStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[1] = auxiliarB[0]
                    estados[1] = auxiliarB[0]
                    
                    //OBTENGO LINEA C
                    
                    let cStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-C\">")
                    
                    let auxiliarC = cStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[2] = auxiliarC[0]
                    estados[2] = auxiliarC[0]
                    
                    //OBTENGO LINEA D
                    
                    let dStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-D\">")
                    
                    let auxiliarD = dStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[3] = auxiliarD[0]
                    estados[3] = auxiliarD[0]
                    
                    //OBTENGO LINEA E
                    
                    let eStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-E\">")
                    
                    let auxiliarE = eStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[4] = auxiliarE[0]
                    estados[4] = auxiliarE[0]
                    
                    //OBTENGO LINEA H
                    
                    let hStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-H\">")
                    
                    let auxiliarH = hStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[5] = auxiliarH[0]
                    estados[5] = auxiliarH[0]
                    
                    //OBTENGO LINEA PREMETRO
                    
                    let pStatusRaw = urlcontent.componentsSeparatedByString("\"status-line-P\">")
                    
                    let auxiliarP = pStatusRaw[1].componentsSeparatedByString("<")
                    self.estados[6] = auxiliarP[0]
                    estados[6] = auxiliarP[0]
                    
                    //Acá los cargo
                    //print(estados)
                    
                    for index in 0..<self.estados.count {
                    for index in 0..<estados.count {
                    let theRow = self.estadoTable.rowControllerAtIndex(index) as! estadoRow
                    theRow.self.estadoLabel.setText(self.estados[index])
                    theRow.self.estadoImage.setImage(UIImage(named:self.lineas[index]))
                    theRow.self.estadoLabel.setText(estados[index])
                    theRow.self.estadoImage.setImage(UIImage(named:lineas[index]))
                    }
                    
                    }
                    task.resume()
                }
                
}*/