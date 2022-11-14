import ast
file=open('encryptedImage.txt',mode='r')
fileText=file.read()
file.close()
file=open('image.mem',mode='w')
matriz=ast.literal_eval(fileText)
print(matriz)

for row in matriz:
    for element in row:
        text=hex(element)[2:]+'\n'
        file.write(text)
    
for i in range(16384-len(matriz)*len(matriz[0])):
    text='0\n'
    file.write(text)


file.close()