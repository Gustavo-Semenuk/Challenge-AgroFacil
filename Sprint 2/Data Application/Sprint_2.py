print('---------------Cadastro Crédito Rural---------------')

while True:
    cadastro = input('Olá! Realizar cadastro como produtor ou cooperativa? ')

    if cadastro.lower() == 'produtor':
        nome_produtor = input('Ótimo, agora insira aqui seu nome: ')
        endereco_produtor = input('Insira aqui seu endereço: ')
        finalidade_produtor = input(
            'Qual a finalidade do crédito rural?(Custeio, Investimento, Comercialização ou Industrialização): ')

        if finalidade_produtor.lower() == 'custeio':
            fase = input('Qual fase está a produção?(Plantio, manutenção ou colheita): ')
            colheita = input('Qual a data prevista para a colheita? ')
            print('--------------------')
            print(' ')
            print('Obrigado,', nome_produtor, '!')
            print('Antes de finalizar confira todos os dados coletados:')
            print(' ')
            print('-Cadastro como:', cadastro, ';')
            print('-Endereço:', endereco_produtor, ';')
            print('-Finalidade do Crédito Rural:', finalidade_produtor, ';')
            print('-Fase da Produção:', fase, ';')
            print('-Data prevista da colheita:', colheita, '.')
            print(' ')
            print('CADASTRO FINALIZADO!')

        elif finalidade_produtor.lower() == 'investimento':
            destino_investimento = input('A que bem ou serviço será destinado esse crédito? ')
            print('--------------------')
            print(' ')
            print('Obrigado', nome_produtor, '!')
            print('Antes de finalizar confira todos os dados coletados:')
            print(' ')
            print('-Cadastro como:', cadastro, ';')
            print('-Endereço:', endereco_produtor, ';')
            print('-Finalidade do Crédito Rural:', finalidade_produtor, ';')
            print('-Destino do Investimento:', destino_investimento, '.')
            print(' ')
            print('CADASTRO FINALIZADO!')

        elif finalidade_produtor.lower() == 'comercialização' or finalidade_produtor.lower() == 'industrialização':
            print('Obrigado,', nome_produtor, 'não são necessárias maiores informações!')

        else:
            print('Resposta Inválida')

    elif cadastro.lower() == 'cooperativa':
        nome_cooperativa = input('Ótimo, agora insira aqui o nome da cooperativa: ')
        endereco_cooperativa = input('Insira aqui o endereço da cooperativa: ')
        finalidade_cooperativa = input(
            'Qual a finalidade do crédito rural?(Custeio, Investimento,Comercialização ou Industrialização):')

        if finalidade_cooperativa.lower() == 'custeio':
            fase = input('Qual fase está a produção?(Plantio, manutenção ou colheita): ')
            colheita = input('Qual a data prevista para a colheita? ')
            print('--------------------')
            print(' ')
            print('Obrigado', nome_cooperativa, '!')
            print('Antes de finalizar confira todos os dados coletados:')
            print(' ')
            print('-Cadastro como:', cadastro, ';')
            print('-Endereço:', endereco_cooperativa, ';')
            print('-Finalidade do Crédito Rural:', finalidade_cooperativa, ';')
            print('-Fase da Produção:', fase, ';')
            print('-Data prevista da colheita:', colheita, '.')
            print(' ')
            print('CADASTRO FINALIZADO!')

        elif finalidade_cooperativa.lower() == 'investimento':
            destino_investimento = input('A que bem ou serviço será destinado esse crédito? ')
            print('--------------------')
            print(' ')
            print('Obrigado,', nome_cooperativa, '!')
            print('Antes de finalizar confira todos os dados coletados:')
            print(' ')
            print('-Cadastro como:', cadastro, ';')
            print('-Endereço:', endereco_cooperativa, ';')
            print('-Finalidade do Crédito Rural:', finalidade_cooperativa, ';')
            print('-Destino do Investimento:', destino_investimento, '.')
            print(' ')
            print('CADASTRO FINALIZADO!')

        elif finalidade_cooperativa.lower() == 'comercialização' or finalidade_cooperativa.lower() == 'industrialização':
            print('Obrigado,', nome_cooperativa, 'não são necessárias maiores informações!')

        else:
            print('Resposta Inválida')

    else:
        print('Opção de cadastro inválida')

    outro_cadastro = input('Deseja realizar outro cadastro? (S/N): ')
    if outro_cadastro.lower() != 'sim':
        break

print('Fim do programa.')
