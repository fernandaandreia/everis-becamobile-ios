//
//  FilmesDetalhesAPI.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 08/01/21.
//

import UIKit
import Alamofire

class FilmesDetalhesAPI: NSObject {
    
    // MARK: Atributos
    
    var listaDeFilmes:Array<String> = ["Homem Aranha", "Cloverfield - Monstro", "Harry Potter"]
    let personalKeyAPI:String = "ccb1629a18998c24e2b10223c88b1c5e"
    let urlAPIDetalhes:String = "https://api.themoviedb.org/3/trending/all/week?api_key=ccb1629a18998c24e2b10223c88b1c5e&language=pt-BR"
    
    // MARK: Requisicao .GET

        func requisicaoAPIDetalhes() {
    
               Alamofire.request(urlAPIDetalhes, method: .get).responseJSON { (response) in
    
                       switch response.result {
    
                       case .success:
                         if let resultChamadaAPI = response.result.value as? Dictionary<String, Any> {
                         guard let listaDeDetalhes = resultChamadaAPI["results"] as? Array<Dictionary<String,Any>> else { return }
                            print(listaDeDetalhes)
                            print("Req. Detalhes OK")
    
                           }
    
                           break
                       case .failure:
                         print(response.error!)
//                        print("not working")
                       break
    
                       }
    
                   }
    
            }

}
