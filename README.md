# Interpretador Prolog Proposicional em Haskell

[cite_start]Este projeto é um interpretador para um subconjunto da linguagem Prolog restrito à lógica proposicional[cite: 6]. [cite_start]Ele foi desenvolvido como Trabalho Prático para a disciplina **CSI107 - Linguagens de Programação** do Departamento de Computação e Sistemas (DECSI) da UFOP[cite: 1, 4].

## 🎯 Objetivo
[cite_start]O sistema determina se uma consulta (`Query`) é uma consequência lógica de um programa composto por cláusulas de Horn proposicionais utilizando uma versão simplificada do método de resolução SLD[cite: 7, 8].

## 🚀 Funcionalidades
- [cite_start]**Resolução SLD Simplificada**: Seleção do primeiro literal, busca de cláusulas compatíveis e substituição recursiva[cite: 37, 38, 39, 40].
- [cite_start]**Backtracking e Múltiplas Soluções**: Implementação que enumera todos os caminhos de prova possíveis (Garante +2 pontos extras conforme o requisito)[cite: 44, 76].
- [cite_start]**Tipagem Forte**: Uso de tipos de dados customizados para Átomos, Cláusulas e Programas[cite: 47, 48, 49, 50, 51].
- [cite_start]**Código Puro**: Implementação sem o uso de bibliotecas externas, operações de IO ou o comando `if-then-else`[cite: 56, 57].

## 🛠️ Especificação Técnica
- [cite_start]**Linguagem**: Haskell[cite: 46].
- [cite_start]**Função Principal**: `solve :: Program -> Query -> Bool`[cite: 52].
- [cite_start]**Módulo**: O projeto reside em um único módulo autossuficiente[cite: 57].

## 📋 Como Testar
Como o interpretador não utiliza IO, os testes devem ser realizados via GHCi:

1. Abra o terminal na pasta do projeto.
2. Inicie o interpretador Haskell:
   ```bash
   ghci InterpretadorProlog.hs

3. Carregue o módulo:
   ```haskell



O resultado esperado é [True, True, False] correspondente aos três exemplos de teste exigidos.

✒️ Dupla
Melissa MM Souza e Felipe Victo


Instituição: Universidade Federal de Ouro Preto (UFOP).


Professor: Elton M. Cardoso.