//
//  ExibeFilmes.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 07/01/21.
//

import UIKit

class ExibeFilmes: NSObject {
    
    func consultaFilmes(){
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=ccb1629a18998c24e2b10223c88b1c5e") else { return }
        var requisicao =  URLRequest(url: url)
    }

}
