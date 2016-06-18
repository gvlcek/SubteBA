//
//  ServicioSubte.swift
//  SubteBA
//
//  Created by Guadalupe Vlcek on 18/6/16.
//  Copyright © 2016 Vlcek Guadalupe. All rights reserved.
//

import UIKit

class EstadoSubte {
    let linea: String
    let estado: String
    let iconName: String
    
    lazy var icon: UIImage = { return UIImage(named: self.iconName)! }()
    
    init(linea: String, estado: String, iconName: String) {
        self.linea = linea
        self.estado = estado
        self.iconName = iconName
    }
}

class ServicioSubte: NSObject {
    
    let lineas = ["lineaA", "lineaB", "lineaC", "lineaD", "lineaE", "lineaH", "lineaP"]
    //var estados = ["","","","","","",""]
    let titulos = ["Linea A", "Linea B", "Linea C", "Linea D", "Linea E", "Linea H", "Linea P"]
    
    func buscaDatos(respuesta: [EstadoSubte] -> Void) {
        
        let url = NSURL(string: "http://www.metrovias.com.ar")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            
            [weak self](data, response, error) in
            
            guard let sself = self else { return }
            let urlcontent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
            
            var estados = [EstadoSubte]()
            
            let separadores = [
                "\"status-line-A\">",
                "\"status-line-B\">",
                "\"status-line-C\">",
                "\"status-line-D\">",
                "\"status-line-E\">",
                "\"status-line-H\">",
                "\"status-line-P\">"
            ]
            
            for (index, linea) in separadores.enumerate() {
                let aStatusRaw = urlcontent.componentsSeparatedByString(linea)
                let auxiliar = aStatusRaw[1].componentsSeparatedByString("<")
                
                let s = EstadoSubte(linea: sself.titulos[index], estado: auxiliar[0], iconName: sself.lineas[index])
                
                estados.append(s)
                
            }
            respuesta(estados)
        }
        
        task.resume()
    }

}
