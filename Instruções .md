Este algoritmo genérico serve como base para implementar o controle de relegadores em diversos sistemas. Ele pode ser adaptado de acordo com o número de pulsos do seu relegador, 
seguindo os passos descritos abaixo e utilizando as funções S-function do Simulink/MATLAB.

Etapas da Implementação:

1- Definição do Número de Pulsos: 
    Determine o número de pulsos do seu relegador. No exemplo da Figura 06 do artigo, o relegador possui quatro pulsos. 

2-Criação das Funções S no MATLAB: 
  Para cada pulso do relegador, crie uma função S-function no Simulink/MATLAB. Em que cada pulso deverá ter um bloco e esse implementado com o algoritmo nomeado de "bloco- religador"; 
  As funções S-function devem ser definidas de acordo com a lógica de operação do seu relegador, considerando os estados de entrada e saída desejados, lembrando que o esquema é baseado na Figura 06 do artigo. 

3-Implementação do Algoritmo:
  Implemente o algoritmo genérico utilizando as funções S-function criadas. O bloco deve reserver os valores de fase e ângulo de cada fase e a saída do ultimo blco, deve ser concetada a um Tree-Phase Breaker, para servir como abertura do sistema. 
