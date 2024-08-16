programa {

    inclua biblioteca Util --> U
    cadeia funcionario_nome[10], funcionario_cpf[10]
    real funcionario_salario[10]
    inteiro funcionario_entrada[10], funcionario_saida[10]
    cadeia nome, cpf
    inteiro opcao, i, numero, horaEntrada, horaSaida
    logico encontrado  

    funcao inicio() {
    
        para (i = 0; i < 10; i++) {		//Começar o vetor zerado
            funcionario_nome[i] = ""
            funcionario_cpf[i] = ""
            funcionario_salario[i] = 0.0
            funcionario_entrada[i] = -1
            funcionario_saida[i] = -1
        }

        faca {
            escreva("============================================")
            escreva("\nMENU DE OPÇÕES:\n")
            escreva("1) Cadastrar funcionário\n")
            escreva("2) Listar funcionários\n")
            escreva("3) Remover funcionário\n")
            escreva("4) Calcular e exibir folha de pagamento\n")
            escreva("5) Registrar ponto\n")
            escreva("6) Exibir relatório de horas trabalhadas\n")
            escreva("7) Editar funcionário\n")
            escreva("0) Sair\n")
            escreva("============================================\n")
            escreva("Escolha sua opção: ")
            leia(opcao)
            limpa()

            escolha(opcao) {
                caso 1:
                    // Cadastro de funcionário
                    encontrado = falso
                    para (i = 0; i < 10; i++) {
                        se (funcionario_nome[i] == "") {
                            encontrado = verdadeiro
                            pare
                        }
                    }

                    se (encontrado) {
                        escreva("\nDigite o nome do funcionário: ")
                        leia(nome)
                        escreva("Digite o CPF do funcionário: ")
                        leia(cpf)
                        escreva("Digite o salário do funcionário: ")
                        leia(funcionario_salario[i])
                        limpa()
                        funcionario_nome[i] = nome
                        funcionario_cpf[i] = cpf
                        escreva("Funcionário cadastrado com sucesso.\n")
                    } senao {
                        escreva("Não há espaço para mais funcionários.\n")
                    }
                    pare

                caso 2:
                    // Lista de funcionários
                    escreva("\nLISTA DE FUNCIONÁRIOS:\n")
                    encontrado = falso
                    para (i = 0; i < 10; i++) {
                        se (funcionario_nome[i] != "") {
                            escreva("ID do funcionário: ", i,", \nNome: ", funcionario_nome[i], ",\nCPF: ", funcionario_cpf[i], ",\nSalário: R$ ", funcionario_salario[i], "\n")
                            encontrado = verdadeiro
                            Util.aguarde(6000)
                            limpa()
                        }
                    }
                    se (nao encontrado) {
                        escreva("\nNenhum funcionário cadastrado.\n")
                    }
                    escreva("\nVoltando pro menu principal...\n")
                    Util.aguarde(4000)
                    pare

                caso 3:
                    // Remoção de funcionário
                    escreva("\nFuncionários cadastrados:\n\n")
                    encontrado = falso
                    para (i = 0; i < 10; i++) {
                        se (funcionario_nome[i] != "") {
                            escreva("ID do funcionário:, ", i, ", Nome: ", funcionario_nome[i], ", CPF: ", funcionario_cpf[i], ", Salário: R$", funcionario_salario[i], "\n")
                            encontrado = verdadeiro
                            
                        }
                    }
                    se (nao encontrado) {
                        escreva("Nenhum funcionário cadastrado, voltando ao menu principal. \n") // verificação
                        Util.aguarde(4000)
                    } senao {
                        escreva("Selecione o id de cadastro do funcionário para remover: ") // caso tenha, remova
                        leia(numero)
                        se (numero >= 0 e numero < 10 e funcionario_nome[numero] != "") {
                            funcionario_nome[numero] = ""
                            funcionario_cpf[numero] = ""
                            funcionario_salario[numero] = 0.0
                            funcionario_entrada[numero] = -1
                            funcionario_saida[numero] = -1
                            escreva("Funcionário removido.\n")
                            Util.aguarde(4000)
                        } senao {
                            escreva("Número inválido ou funcionário não encontrado.\n") // Número invalido verificar
                        }
                    }
                    pare
					//Puxar Folha de Pagamento
                caso 4:
                    encontrado = falso
                    calcularFolhaPagamento()
                    pare

                caso 5:
                    // Registrar ponto
                    escreva("\nDigite o CPF do funcionário: ")
                    leia(cpf)
                    encontrado = falso

                    para (i = 0; i < 10; i++) {
                        se (funcionario_cpf[i] == cpf) {
                            encontrado = verdadeiro
                            escreva("Digite a hora de entrada (em formato HHMM, ex: 0900 para 9:00): ")
                            leia(horaEntrada)
                            escreva("Digite a hora de saída (em formato HHMM, ex: 1800 para 18:00): ")
                            leia(horaSaida)

                            funcionario_entrada[i] = horaEntrada
                            funcionario_saida[i] = horaSaida

                            escreva("Ponto registrado com sucesso, voltando ao menu principal... \n")
                            Util.aguarde(5000)
                            limpa()
                            pare
                        }
                    }

                    se (nao encontrado) {
                        escreva("Funcionário não encontrado, voltando ao menu principal... \n")          
                        Util.aguarde(5000)
                        limpa()
                    }
                    pare

                caso 6:
                    // Exibir relatório de horas trabalhadas
                    exibirRelatorioPonto()
                    pare

                caso 7:
                    // Editar funcionário
                    escreva("\nDigite o CPF do funcionário que deseja editar: ")
                    leia(cpf)
                    encontrado = falso

                    para (i = 0; i < 10; i++) {
                        se (funcionario_cpf[i] == cpf) {
                            encontrado = verdadeiro
                            escreva("Funcionário encontrado.\n")
                            escreva("Digite o novo nome do funcionário (ou deixe em branco para manter o atual): ")
                            leia(nome)
                            escreva("Digite o novo salário do funcionário (ou deixe como 0 para manter o atual): ")
                            leia(funcionario_salario[i])

                            se (nome != "") {
                                funcionario_nome[i] = nome
                            }

                            escreva("Dados do funcionário atualizados com sucesso, voltando ao menu principal... \n")
                            Util.aguarde(5000)
                            limpa()
                            pare
                        }
                    }

                    se (nao encontrado) {
                        limpa()
                        escreva("Funcionário não encontrado, voltando ao menu principal... \n")
                        Util.aguarde(5000)
                        limpa()
                    }
                    pare

                caso 0: //bonitin o código naquele pique jogador caro
                    limpa()
                    escreva("█▒▒▒▒▒▒▒▒▒ 10% ")
                    Util.aguarde(3000)
                    limpa()
                    escreva("█████▒▒▒▒▒ 50%")
                    Util.aguarde(2000)
                    limpa()
                    escreva("███████▒▒▒ 70%")
                    Util.aguarde(1000)
                    limpa()
                    escreva("█████████▒ 90%")
                    Util.aguarde(1000)
                    limpa()
                    escreva(" ██████████ 100%")
                    Util.aguarde(1000)
                    limpa()
                    
                    escreva("╔════════════════════════════════════════════════════════════╗\n")
                    escreva("   Sistema finalizado com sucesso, obrigado por utilizar.")
                    escreva("\n\n  	     Trabalho realizado pelo grupo 05")
                    escreva("\n\n      Rafael, Renan, Tiago, Victor, Vitor e Thamires")
                    escreva("\n\n  		      Serratec - 2024\n")
                    escreva("╚════════════════════════════════════════════════════════════╝\n")
                    
                    pare

                caso contrario: //Caso a opção não existe, retorne
                    limpa()
                    escreva("Opção inválida, por favor selecione uma opção correta\n")
                    Util.aguarde(5000)
            }
        } enquanto(opcao != 0) //verifica certo ai plmds ta contando ponto

    }
   //Parte pra calcular a aliquota do salario, puxar foi dificil mas a vitória chegou
    funcao real calcularINSS(real salario) {  //INSS
        real descontoINSS = 0.0

        se(salario <= 1412.01) {
            descontoINSS = salario * 0.075
        }
        senao se(salario <= 2666.68) {
            descontoINSS = salario * 0.09
        }
        senao se(salario <= 4000.03) {
            descontoINSS = salario * 0.12
        }
        senao {
            descontoINSS = salario * 0.14
        }
        retorne descontoINSS
    }

    funcao real calcularIRRF(real salario) { //IRRF
        real descontoIRRF = 0.0

        se(salario <= 2112.00) {
            descontoIRRF = 0.0
        }
        senao se(salario <= 2826.65) {
            descontoIRRF = salario * 0.075
        }
        senao se(salario <= 3751.05) {
            descontoIRRF = salario * 0.15
        }
        senao se(salario <= 4664.68) {
            descontoIRRF = salario * 0.225
        }
        senao {
            descontoIRRF = salario * 0.275
        }
        retorne descontoIRRF
    }

    funcao calcularFolhaPagamento() { //LOOP PRA LER O 'BANCO DE DADOS' VERIFICANDO TODOS COM UM DELAY"
        real inss, irrf, salarioLiquido

        para(i = 0; i < 10; i++) {
            se (funcionario_nome[i] != "") {
                inss = calcularINSS(funcionario_salario[i])
                irrf = calcularIRRF(funcionario_salario[i])
                salarioLiquido = funcionario_salario[i] - inss - irrf
                escreva("Nome: ", funcionario_nome[i], "\n")
                escreva("Salário Bruto: R$ ", funcionario_salario[i], "\n")
                escreva("Desconto INSS: R$ ", inss, "\n")
                escreva("Desconto IRRF: R$ ", irrf, "\n")
                escreva("Salário Líquido: R$ ", salarioLiquido, "\n\n")
                Util.aguarde(4000)
            }
        }
    }
//Parte do relatorio de ponto
    funcao exibirRelatorioPonto() {
        inteiro horasTrabalhadas

        para(i = 0; i < 10; i++) {
            se (funcionario_nome[i] != "") {
                se (funcionario_entrada[i] != -1 e funcionario_saida[i] != -1) {
                    horasTrabalhadas = calcularHorasTrabalhadas(funcionario_entrada[i], funcionario_saida[i])
                    escreva("Nome: ", funcionario_nome[i], "\n")
                    escreva("CPF: ", funcionario_cpf[i], "\n")
                    escreva("Horas Trabalhadas: ", horasTrabalhadas, "\n\n")
                    Util.aguarde(5000)
                } senao {
                    escreva("Nome: ", funcionario_nome[i], " (sem registro de ponto)\n\n")
                    Util.aguarde(5000)
                    limpa()
                }
            }
        }
    }

    funcao inteiro calcularHorasTrabalhadas(inteiro entrada, inteiro saida) {
        inteiro horasEntrada, minutosEntrada, horasSaida, minutosSaida, totalMinutos

        horasEntrada = entrada / 100
        minutosEntrada = entrada % 100
        horasSaida = saida / 100
        minutosSaida = saida % 100

        totalMinutos = (horasSaida * 60 + minutosSaida) - (horasEntrada * 60 + minutosEntrada)
        retorne totalMinutos / 60 // Retorna o total de horas trabalhadas
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9249; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */