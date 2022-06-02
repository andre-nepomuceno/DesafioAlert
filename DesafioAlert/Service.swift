//
//  Service.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 30/05/22.
//

import Foundation

class Service {
    
    private var listaDeFilmes: [Filme] = []
    private var usuarioLogado: Usuario = Usuario(nome: "Andre")
    
    init() {
        listaDeFilmes = Filme.criarFilmesDeTerror()
    }
    
    func obterTodosOsFilmes(completion: @escaping ([Filme]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(self.listaDeFilmes)
        }
    }
    
    func obterFilmePor(posicao: Int, completion: @escaping (Filme?) -> Void) {
        let filmeEscolhido = listaDeFilmes[posicao]
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(filmeEscolhido)
        }
    }
    
    func obterUsuarioLogado(completion: @escaping (Usuario) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            completion(self.usuarioLogado)
        }
    }
}
