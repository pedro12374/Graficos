#Gera e converte a tabela de resistencias ligada as temperaturas que esta no arquivo TB.dat
TR = []
with open('TB.dat','rb') as tabela:
    for linha in tabela:
        fields = linha.split(' ')
        TR.append(fields)

for i in range(len(TR)):
    TR[i][1] = TR[i][1].replace('\n','')
#Gera o array contendo os valores para as resistencias
for i in range(len(TR)):
    for j in range(len(TR[i])):
        TR[i][j] = float(TR[i][j])

#Abre e organiza o arquivo contendo as resistencias medidas experimentalmente
Tp = open('T.dat','r')
T = []
T = Tp.readlines()
for i in range(len(T)):
    T[i] = T[i].replace('\n','')
    T[i] = float(T[i])
#Faz o calculo de conversao caso a resistencias nao existe na tabela
Tc=[]
for i in range(len(T)-1):
    for j in range(len(TR)):
        if TR[j][0]<T[i]:
            Tb = TR[j][0]
            ta = TR[j][1]
            Ta = TR[j-1][0]
            break
        else:
            continue
    dt=(Ta-T[i])*(1/(Ta-Tb))
    Tf = ta + dt + 273.15
    Tc.append(round(Tf,3))

    for j in range(len(TR)):
        if T[i]==TR[j][0]:
            Tc[i]=(TR[j][1] + 273.15)


#Calcula a variacao de temperatura(dT) e o rendimento de carnot(NC) e o rendimento real(Nr) e guarda em uma matriz
dT = []
Nc=[]
for i in range(len(Tc)/2):
    m = Tc[i]-Tc[i+len(Tc)/2]
    n = abs(m/Tc[i])*100
    Nc.append(round(n,3))
    dT.append(round(m,3))
Nr = [2.210,3.746,1.077,0.646,0.344]
#Salva o rendimento de carnot e o rendimento real em um arquivo junto com a variação de tempeatura
NrxT = open('Maquina(NrxT).dat','w')
NcxT = open('Maquina(NcxT).dat','w')
for i in range(len(Nr)):
    NrxT.write(str(dT[i]) + '\t' + str(Nr[i])+'\n')
    NcxT.write(str(dT[i]) + '\t' + str(Nc[i])+'\n')
NrxT.close()
NcxT.close()
