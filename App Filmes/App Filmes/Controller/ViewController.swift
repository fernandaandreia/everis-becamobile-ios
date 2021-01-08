//
//  ViewController.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 07/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    // MARK: Atributos
    var listaDeFilmes:Array<String> = ["Homem Aranha", "Cloverfield - Monstro", "Harry Potter"]
    let personalKeyAPI:String = "ccb1629a18998c24e2b10223c88b1c5e"
    let urlAPI:String = "https://api.themoviedb.org/3/trending/all/week?api_key=ccb1629a18998c24e2b10223c88b1c5e&language=pt-BR"

    override func viewDidLoad() {
        super.viewDidLoad()
        requisicaoAPITrending()
    }

    @IBAction func buttonBuscarFilme(_ sender: Any) {
    }
    
    
    func requisicaoAPITrending() {

           Alamofire.request(urlAPI, method: .get).responseJSON { (response) in

                   switch response.result {
                   case .success:
                     if let resultChamadaAPI = response.result.value as? Dictionary<String, Any> {
                     guard let listaTrending = resultChamadaAPI["results"] as? Array<Dictionary<String,Any>> else {return}
                   print(listaTrending)
                       }

                       break
                   case .failure:
                     print(response.error!)
                   break

                   }

               }

        }
    

}

