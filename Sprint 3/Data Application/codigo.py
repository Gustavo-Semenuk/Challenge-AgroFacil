import csv
def obter_dados_solicitante():
    tipo_doc = input("Irá fornecer o 'CPF' ou 'CNPJ' do solicitante?: ")
    doc = input(f"Digite o {tipo_doc}: ")
    garantia = input("Qual será a garantia usada para o empréstimo? (Real, Pessoal ou Penhor): ")
    vl_garantia = float(input("E qual será o valor da garantia?: "))
    return {'Tipo Documento': tipo_doc, 'Documento': doc, 'Garantia': garantia, 'Valor Garantia': vl_garantia}
def cadastrar_solicitante_em_csv(solicitante):
    with open('solicitantes.csv', 'a', newline='') as arquivo_csv:
        campos = ['Tipo Documento', 'Documento', 'Garantia', 'Valor Garantia']
        escritor_csv = csv.DictWriter(arquivo_csv, fieldnames=campos)

        if arquivo_csv.tell() == 0:
            escritor_csv.writeheader()

        escritor_csv.writerow(solicitante)
        print("Dados do solicitante foram adicionados a 'solicitantes.csv'")

solicitantes = []  # Aqui é a coleção que irá armazenar os dados

continuar = 's'
while continuar.lower() == 's':
    solicitante = obter_dados_solicitante()
    solicitantes.append(solicitante)  # Adicionando o solicitante à coleção
    cadastrar_solicitante_em_csv(solicitante)
    print("______________________________________________________________")
    continuar = input("Deseja cadastrar outro solicitante? (S/N): ")
    print("______________________________________________________________")

print("\nSolicitantes cadastrados:")
for solicitante in solicitantes:
    print(solicitante)

print("Arquivo 'solicitantes.csv' foi fechado.")






