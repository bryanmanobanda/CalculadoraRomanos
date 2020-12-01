#Calculadora Romanos🙈💻

Calculadora de numeros romanos que realiza operaciones de suma, resta, multiplicación, dividisión, logaritmos, exponencial, seno, coseno, tangente, raíz y potenciación.

##Instalación 🚀

Para que el programa corra sin ningun error debes tener instalado lex y yacc.
En caso de no tenerlo instalarlo corre la siguientes instrucciones en una terminal de ubuntu. Recuerda actualizar los paquetes antes de correr cualquier comando.

###### Instalar lex
>sudo apt-get install flex

###### Instalar yacc
>sudo apt-get install bison

## Ejecución del programa ⚙️

Para poder ejecutar el programa desde consola dentro de la carpeta del proyecto corre los siguientes comandos.
```
lex project.l
yacc -d -v project.y
gcc lex.yy.c y.tab.c -lfl -lm
./a.out
```
En caso de cambiar el nombre al archivo, en las instrucciones cambiar project por el nombre asignado.

###Uso del programa ⌨️

Las operaciones empezarqan con "=" seguido de numeros romanos (mayúsculas o minúsculas) o signos de agrupación , seguido de la operación y al final de toda la secuencia debe terminar con punto y coma.

###### Ejemplos:

- =iIi+IV;
- =X+ii^(iIi);
- =v*ii-cos(z);
- =cos(z)+(ln(i)-iiI*v)\** sen(z);
- =ln(I)-ii+(Iii^ii)-(X-v-Xii)+e^(z);

El programa no admite espacios en blanco y tiene un limite de -30000 hasta 30000.

###### Equivalencia de números

| Signos | Romanos  | Decimal  |
| :------------: | :------------: | :------------: |
| +- |  Z| 0 | 
| +-  |  I |  1 |
| +- |V| 5  |
| +-  | X  | 10  |
| +- | L |  50 |
| +-  | C  |  100 |
| +- |D|  500 |
| +-  | M  |  1000 |
| +- |G|  5000 |
| +-  |  P |  10000 |

###### Expresiones

| Expresión  | Asignación  |
| ------------ | ------------ |
| logaritmo  | ln(num) |
| potencia  | num ^ num  |
| raiz  | sqr(num)  |
| exponencial  | e^(num)  |
| seno   | sen(num)  |
| coseno  | cos(num)  |
|  tangente | tan(num)  |

###Presentación del programa

El resultado se presentara en números romanos, binario, decimal, octal y hexadecimal. En caso de que el resultado sea negativo solo mostrara el decimal y cuando presente decimales los valores se presentaran como enteros.

### Construido con 🛠️

* Lenguaje C
* Compilador Lex y Yacc

### Licencia 📄

Este proyecto está bajo la Licencia (MIT License)

###Siguiente Paso 😃

* Comenta a otros sobre este proyecto 📢
* Sigueme y no te olvides de compartir mi perfil 💜
