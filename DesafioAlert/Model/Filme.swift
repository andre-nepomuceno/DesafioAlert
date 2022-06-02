//
//  Filme.swift
//  DesafioAlert
//
//  Created by André N. dos Santos on 30/05/22.
//

import Foundation

class Filme {
    let titulo: String
    let anoDeLancamento: Int
    let genero: String
    let poster: String
    
    init(titulo: String, anoDeLancamento: Int, genero: String, poster: String) {
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
            poster: "ABruxaDeBlair"
        ))
        filmes.append(Filme(
            titulo: "Alien",
            anoDeLancamento: 1979,
            genero: "Terror",
            poster: "Alien"
        ))
        filmes.append(Filme(
            titulo: "A Profecia",
            anoDeLancamento: 1976,
            genero: "Terror",
            poster: "AProfecia"
        ))
        filmes.append(Filme(
            titulo: "A culpa é das estrelas",
            anoDeLancamento: 2014,
            genero: "Romance",
            poster: "aculpaedasestrelas"
        ))
        filmes.append(Filme(
            titulo: "Amor & outras drogas",
            anoDeLancamento: 2011,
            genero: "Romance",
            poster: "amoreoutrasdrogas"
        ))
        filmes.append(Filme(
            titulo: "Duna",
            anoDeLancamento: 2021,
            genero: "Ficção Ceintífica",
            poster: "duna"
        ))
        filmes.append(Filme(
            titulo: "Marley & Eu",
            anoDeLancamento: 2008,
            genero: "Comédia Romântica",
            poster: "marley"
        ))
        filmes.append(Filme(
            titulo: "O estranho mundo de Jack",
            anoDeLancamento: 1993,
            genero: "Animação",
            poster: "oestranhomundodejack"
        ))
        filmes.append(Filme(
            titulo: "Quatro vidas de um cachorro",
            anoDeLancamento: 2017,
            genero: "Drama",
            poster: "quatrovidas"
        ))
        filmes.append(Filme(
            titulo: "Shrek",
            anoDeLancamento: 2001,
            genero: "Animação",
            poster: "shrek"
        ))
        filmes.append(Filme(
            titulo: "The Batman",
            anoDeLancamento: 2022,
            genero: "Aventura",
            poster: "thebatman"
        ))
        filmes.append(Filme(
            titulo: "Viva! A vida é uma festa!",
            anoDeLancamento: 2018,
            genero: "Animação",
            poster: "viva"
        ))
        return filmes
    }
}
