# Interpretador Prolog Proposicional em Haskell

Este projeto é um interpretador para um subconjunto da linguagem Prolog restrito à lógica proposicional. Ele foi desenvolvido como Trabalho Prático para a disciplina **CSI107 - Linguagens de Programação** do Departamento de Computação e Sistemas (DECSI) da UFOP

## 🎯 Objetivo
O sistema determina se uma consulta (`Query`) é uma consequência lógica de um programa composto por cláusulas de Horn proposicionais utilizando uma versão simplificada do método de resolução SLD[cite: 7, 8].

## 🚀 Funcionalidades
- **Resolução SLD Simplificada**: Seleção do primeiro literal, busca de cláusulas compatíveis e substituição recursiva.
- **Backtracking e Múltiplas Soluções**: Implementação que enumera todos os caminhos de prova possíveis (Garante +2 pontos extras conforme o requisito).
- **Tipagem Forte**: Uso de tipos de dados customizados para Átomos, Cláusulas e Programas.
- **Código Puro**: Implementação sem o uso de bibliotecas externas, operações de IO ou o comando `if-then-else`.

## 🛠️ Especificação Técnica
- **Linguagem**: Haskell.
- **Função Principal**: `solve :: Program -> Query -> Bool`.
- **Módulo**: O projeto reside em um único módulo autossuficiente.

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
Melissa MM Souza e Felipe Victor


Instituição: Universidade Federal de Ouro Preto (UFOP).



Professor: Elton M. Cardoso.
