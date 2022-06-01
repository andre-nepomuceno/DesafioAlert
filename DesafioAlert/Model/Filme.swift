//
//  Filme.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 30/05/22.
//

import Foundation
import UIKit

class Filme {
    let titulo: String
    let anoDeLancamento: Int
    let genero: String
    let poster: UIImage
    
    init(titulo: String, anoDeLancamento: Int, genero: String, poster: UIImage) {
        self.titulo = titulo
        self.anoDeLancamento = anoDeLancamento
        self.genero = genero
        self.poster = poster
    }
    
    public func obterAnoLancamento() -> String {
        return "Ano de Lançamento: \(anoDeLancamento)"
    }
    public func obterGenero() -> String {
        return "Gênero: \(genero)"
    }
    
    public static func criarFilmesDeTerror() -> [Filme] {
        var filmes: [Filme] = []
        filmes.append(Filme(
            titulo: "A Bruxa de Blair",
            anoDeLancamento: 1999,
            genero: "Terror",
            poster: UIImage(named: "ABruxaDeBlair") ?? UIImage()
        ))
        filmes.append(Filme(
            titulo: "O Enigma de Outro Mundo",
            anoDeLancamento: 1982,
            genero: "Terror",
            poster: UIImage(named: "ACoisa") ?? UIImage()
        ))
        filmes.append(Filme(
            titulo: "Alien",
            anoDeLancamento: 1979,
            genero: "Terror",
            poster: UIImage(named: "Alien") ?? UIImage()
        ))
        filmes.append(Filme(
            titulo: "A Noite dos Mortos-Vivos",
            anoDeLancamento: 1968,
            genero: "Terror",
            poster: UIImage(named: "ANoiteDosMortosVivos") ?? UIImage()
        ))
        filmes.append(Filme(
            titulo: "A Profecia",
            anoDeLancamento: 1976,
            genero: "Terror",
            poster: UIImage(named: "AProfecia") ?? UIImage()
        ))
        return filmes
    }
}
