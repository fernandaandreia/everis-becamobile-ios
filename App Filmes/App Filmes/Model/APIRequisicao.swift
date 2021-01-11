//
//  APIRequisicao.swift
//  App Filmes
//
//  Created by Fernanda Andreia Nascimento on 10/01/21.
//

import UIKit
import Alamofire
import AlamofireImage

class APIRequisicao: NSObject {
    
    // MARK: Variável
    var arrayFilmes:[String:Any] = [:]
    
    // MARK: Método .GET
    
    var filmes:[String:Any] = [:]
    
    // MARK: .GET RequisicaoAPI Trending

    func recuperaFilme (completion:@escaping(_ filmes:[[String:Any]]) -> Void ) {

        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=ccb1629a18998c24e2b10223c88b1c5e&language=pt-BR") else { return }
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            switch response.result {
                case .success:
                    if let resposta = response.result.value as? [String:Any] {
                        
                        var filmeEscolhido:[String:Any] = [:]
                        var tituloDoFilme = ""
                        var lancamentoFilme = ""
                        var listaFilmeCompleta:[[String:Any]] = [[:]]
                        
                        guard let filmes = resposta["results"] as? [[String:Any]] else { return }
                        
                        for filme in filmes {
                            if(filme["title"] != nil) {
                                tituloDoFilme = "title"
                                
                            } else {
                                tituloDoFilme = "name"
                                
                            }
                            if(filme["release_date"] != nil) {
                                
                                lancamentoFilme = "release_date"
                                
                            } else {
                                lancamentoFilme = "first_air_date"
                            }
                            
                            
                            guard let id = filme["id"] else { return }
                            guard let tituloDoFilme = filme[tituloDoFilme] else { return }
                            guard let caminhoPoster = filme["poster_path"] else { return }
                            guard let sinopseFilme = filme["overview"] else { return }
                            guard let dataEstreia = filme[lancamentoFilme] else { return }
                            filmeEscolhido = [
                                "id":id,
                                "nome":tituloDoFilme,
                                "caminho":caminhoPoster,
                                "sinopse":sinopseFilme,
                                "lancamento":dataEstreia
                                
                            ]
                            
                            listaFilmeCompleta.append(filmeEscolhido)
     
                        }
                        completion(listaFilmeCompleta)
                    }
                    break
                case .failure:
                    print(response.error!)
                    print("Requisicao nao está funcionando")
                    break
            }
        }
    }
    
    // MARK : Métodos - Recuperar Imagens
    
    func recuperaImagem(_ completion: @escaping(_ movies: [[String:Any]]) ->Void) {
        recuperaFilme() { (movies) in
            var listaDeFilmes:[[String:Any]] = [[:]]
            for filme in movies {
                if let pathPoster = filme["caminho"] as? String {
                    guard let id = filme["id"] else { return }
                    guard let tituloFilme = filme["nome"] else { return }
                    guard let urlImagem = URL(string: "https://image.tmdb.org/t/p/w500\(pathPoster)") else { return }
                    
                    var filmeSelecionado:[String:Any] = [:]
                    
                    Alamofire.request(urlImagem, method: .get).responseImage(completionHandler: { (response) in
                        switch response.result {
                            case .success:
                                
                                if let poster = response.result.value {
                                    filmeSelecionado = [
                                        "nome":tituloFilme,
                                        "imagem":poster,
                                        "id":id
                                    ]
                                    listaDeFilmes.append(filmeSelecionado)
                                    completion(listaDeFilmes)
                                    print("Requisicao Imagem está funcionando")
                                }
                                break
                            case .failure:
                                print("Requisicao de imagens nao funciona")
                                print(response.error!)
                                break
                        }
                    })
                }
            }
        }
    }
    
    
    func exibeDetalheFilme(_ id:Int, completion: @escaping(_ movies:[String:Any]) -> Void) {
        print("funcionou")
        Alamofire.request("https://api.themoviedb.org/3/movie/\(id)?api_key=ccb1629a18998c24e2b10223c88b1c5e&language=pt-BR", method: .get).responseJSON { (response) in
                switch response.result {
                case .success:
                    if let resposta = response.result.value as? [String:Any] {
                        print("Resultado: \(resposta)")
                        completion(resposta)
                    }
                    break
                case .failure:
              print(response.error!)
                break
                }
            }
    }
    
    
}
