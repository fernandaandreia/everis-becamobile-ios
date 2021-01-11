//
//  InfoFilme.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 08/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class InfoFilme: NSObject {
    
    let tituloDoFilme:String //title
    let sinopseDoFilme:String //overview
    let lancamentoDoFilme:String //release_date
    let cartazDoFilme:UIImage //poster_path
    
    init(tituloDoFilme:String, sinopseDoFilme:String, lancamentoDoFilme:String, cartazDoFilme:UIImage ){
        self.tituloDoFilme = tituloDoFilme
        self.sinopseDoFilme = sinopseDoFilme
        self.lancamentoDoFilme = lancamentoDoFilme
        self.cartazDoFilme = cartazDoFilme
        
    }
    
        
        
    }

