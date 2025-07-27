Algoritmo Integradora
	//Navegación
	Definir opcionMenu Como Entero
	
	//Control
	Definir llaveValida Como Logico
	
	//Variables para leer cadena inicial y convertirla en número
	Definir textoIngresado, lectorCadena Como Cadena
	Definir marcador1, marcador2, puntero, limiteCadena, cantidadDeNumeros, moduloCantidadDeNumeros, columnasMensaje Como Entero
	Definir lectorCaracter Como Caracter
	
	// Variables para matrices
	Definir fila, columna Como Entero
	Definir determinante Como Real
	Dimension llave(3,3), mensajeCifrado(3,10), llaveTranspuesta(3,3), llaveTranspuestaAdjunta(3,3), llaveInversa(3,3), mensajeDescifrado(3,10)
	
	//Variables de salida
	Definir textoSalida Como Cadena
	Definir conversorCaracter Como Caracter
	
	Limpiar Pantalla
	Escribir "TAREA INTEGRADORA - CRIPTOGRAFÍA"
	Escribir ""
	Escribir "Este programa descifra mensajes encriptados de longitud variable utilizando una llave compuesta por nueve números"
	Escribir ""
	Escribir "Presione una tecla para continuar"
	Esperar Tecla
	
	Repetir
		Limpiar Pantalla
		Escribir "TAREA INTEGRADORA - CRIPTOGRAFÍA"
		Escribir ""
		Escribir "Seleccione una opción"
		Escribir "1.- Ingresar llave"
		Escribir "2.- Salir"
		Leer opcionMenu
		Segun opcionMenu hacer
			1:
				Repetir
					Limpiar Pantalla
					Escribir "Ingrese la llave, separando cada número con un espacio"
					Leer textoIngresado
					
					//Establecer longitud del mensaje
					cantidadDeNumeros = 1
					limiteCadena = Longitud(textoIngresado)
					Para puntero = 1 Hasta limiteCadena Con Paso 1 Hacer
						lectorCaracter = Subcadena(textoIngresado,puntero,puntero)
						Si lectorCaracter == " " Entonces
							cantidadDeNumeros = cantidadDeNumeros + 1
						FinSi
					Fin Para
					Si CantidadDeNumeros == 9 Entonces
						//Leer llave y su transpuesta
						puntero = 1
						marcador1 = 1
						textoIngresado = concatenar(textoIngresado," ")
						Para fila = 1 Hasta 3 Con Paso 1 Hacer
							Para columna = 1 Hasta 3 Con Paso 1 Hacer
								Repetir
									lectorCaracter = Subcadena(textoIngresado,puntero,puntero)
									puntero = puntero + 1
								Hasta Que (lectorCaracter == " ")
								marcador2 = puntero - 2
								llave(fila,columna) = ConvertirANumero(Subcadena(textoIngresado,marcador1,marcador2))
								llaveTranspuesta(columna,fila) = llave(fila,columna)
								marcador1 = puntero
							Fin Para
						Fin Para
						
						//Calcular determinante de la llave
						determinante = ((llaveTranspuesta(1,1)*llaveTranspuesta(2,2)*llaveTranspuesta(3,3))+(llaveTranspuesta(2,1)*llaveTranspuesta(3,2)*llaveTranspuesta(1,3))+(llaveTranspuesta(1,2)*llaveTranspuesta(2,3)*llaveTranspuesta(3,1)))-((llaveTranspuesta(1,3)*llaveTranspuesta(2,2)*llaveTranspuesta(3,1))+(llaveTranspuesta(1,2)*llaveTranspuesta(2,1)*llaveTranspuesta(3,3))+(llaveTranspuesta(2,3)*llaveTranspuesta(3,2)*llaveTranspuesta(1,1)))
						
						Si determinante <> 0 Entonces
							//Calcular adjunta de la transpuesta de la matriz
							llaveTranspuestaAdjunta(1,1) = (llaveTranspuesta(2,2)*llaveTranspuesta(3,3))-(llaveTranspuesta(2,3)*llaveTranspuesta(3,2))
							llaveTranspuestaAdjunta(1,2) = -((llaveTranspuesta(2,1)*llaveTranspuesta(3,3))-(llaveTranspuesta(2,3)*llaveTranspuesta(3,1)))
							llaveTranspuestaAdjunta(1,3) = (llaveTranspuesta(2,1)*llaveTranspuesta(3,2))-(llaveTranspuesta(2,2)*llaveTranspuesta(3,1))
							llaveTranspuestaAdjunta(2,1) = -((llaveTranspuesta(1,2)*llaveTranspuesta(3,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(3,2)))
							llaveTranspuestaAdjunta(2,2) = (llaveTranspuesta(1,1)*llaveTranspuesta(3,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(3,1))
							llaveTranspuestaAdjunta(2,3) = -((llaveTranspuesta(1,1)*llaveTranspuesta(3,2))-(llaveTranspuesta(1,2)*llaveTranspuesta(3,1)))
							llaveTranspuestaAdjunta(3,1) = (llaveTranspuesta(1,2)*llaveTranspuesta(2,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(2,2))
							llaveTranspuestaAdjunta(3,2) = -((llaveTranspuesta(1,1)*llaveTranspuesta(2,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(2,1)))
							llaveTranspuestaAdjunta(3,3) = (llaveTranspuesta(1,1)*llaveTranspuesta(2,2))-(llaveTranspuesta(1,2)*llaveTranspuesta(2,1))
							
							//Calcular inversa de la llave
							para fila = 1 Hasta  3 Con Paso 1 Hacer
								para columna = 1 Hasta  3 Con Paso 1 Hacer
									llaveInversa(fila,columna) = llaveTranspuestaAdjunta(fila,columna)/determinante
								FinPara
							FinPara
						SiNo
							llaveValida = Falso
							Escribir "Llave inválida, no es invertible"
							Esperar 1 Segundos
						FinSi
					SiNo
						llaveValida = Falso
						Escribir "Llave inválida, no tiene 9 números"
						Esperar 1 Segundos
					FinSi
				Hasta Que llaveValida = Verdadero
			2:
				opcionMenu = 3
			De Otro Modo:
				Escribir "Opción inválida"
				opcionMenu = 0
				Esperar 1 Segundos
		FinSegun
	Hasta Que (opcionMenu == 1)|(opcionMenu == 3)
	
	Mientras opcionMenu <> 3 Hacer
		Limpiar Pantalla
		Escribir "TAREA INTEGRADORA - CRIPTOGRAFÍA"
		Escribir ""
		Escribir "Seleccione una opción"
		Escribir "1.- Descifrar un mensaje"
		Escribir "2.- Cambiar llave"
		Escribir "3.- Salir"
		Leer opcionMenu
		Segun opcionMenu Hacer
			1:
				Repetir
					Limpiar Pantalla
					Escribir "Ingrese el mensaje, separando cada número con un espacio"
					Leer textoIngresado
					
					//Establecer longitud del mensaje
					cantidadDeNumeros = 1
					limiteCadena = Longitud(textoIngresado)
					Para puntero = 1 Hasta limiteCadena Con Paso 1 Hacer
						lectorCaracter = Subcadena(textoIngresado,puntero,puntero)
						Si lectorCaracter == " " Entonces
							cantidadDeNumeros = cantidadDeNumeros + 1
						FinSi
					Fin Para
					
					moduloCantidadDeNumeros = CantidadDeNumeros % 3
					Si moduloCantidadDeNumeros == 0 Entonces
						columnasMensaje = CantidadDeNumeros / 3
						
						//Leer mensaje cifrado
						puntero = 1
						marcador1 = 1
						textoIngresado = concatenar(textoIngresado," ")
						Para fila = 1 Hasta 3 Con Paso 1 Hacer
							Para columna = 1 Hasta columnasMensaje Con Paso 1 Hacer
								Repetir
									lectorCaracter = Subcadena(textoIngresado,puntero,puntero)
									puntero = puntero + 1
								Hasta Que (lectorCaracter == " ")
								marcador2 = puntero - 2
								mensajeCifrado(fila,columna) = ConvertirANumero(Subcadena(textoIngresado,marcador1,marcador2))
								marcador1 = puntero
							Fin Para
						Fin Para
						
						//Descifrar mensaje
						para fila = 1 Hasta  3 Con Paso 1 Hacer
							para columna = 1 Hasta  columnasMensaje Con Paso 1 Hacer
								mensajeDescifrado(fila,columna) = (llaveInversa(fila,1)*mensajeCifrado(1,columna))+(llaveInversa(fila,2)*mensajeCifrado(2,columna))+(llaveInversa(fila,3)*mensajeCifrado(3,columna))
							FinPara
						FinPara
						
						//Convertir matriz descifrada a texto
						para columna = 1 Hasta  columnasMensaje Con Paso 1 Hacer
							para fila = 1 Hasta  3 Con Paso 1 Hacer
								Segun redon(mensajeDescifrado(fila,columna)) Hacer
									1:
										conversorCaracter = 'A'
									2:
										conversorCaracter = 'B'
									3:
										conversorCaracter = 'C'
									4:
										conversorCaracter = 'D'
									5:
										conversorCaracter = 'E'
									6:
										conversorCaracter = 'F'
									7:
										conversorCaracter = 'G'
									8:
										conversorCaracter = 'H'
									9:
										conversorCaracter = 'I'
									10:
										conversorCaracter = 'J'
									11:
										conversorCaracter = 'K'
									12:
										conversorCaracter = 'L'
									13:
										conversorCaracter = 'M'
									14:
										conversorCaracter = 'N'
									15:
										conversorCaracter = 'O'
									16:
										conversorCaracter = 'P'
									17:
										conversorCaracter = 'Q'
									18:
										conversorCaracter = 'R'
									19:
										conversorCaracter = 'S'
									20:
										conversorCaracter = 'T'
									21:
										conversorCaracter = 'U'
									22:
										conversorCaracter = 'V'
									23:
										conversorCaracter = 'W'
									24:
										conversorCaracter = 'X'
									25:
										conversorCaracter = 'Y'
									26:
										conversorCaracter = 'Z'
									27:
										conversorCaracter = ' '
								FinSegun
								textoSalida = Concatenar(textoSalida,conversorCaracter)
							FinPara
						FinPara
						
						Escribir "El mensaje descifrado es:"
						Escribir textoSalida
						textoSalida = ""
						Escribir ""
						Escribir "Presione una tecla para volver al menú"
						Esperar Tecla
					SiNo
						Escribir "Mensaje inválido"
						Esperar 1 Segundos
					FinSi
				Hasta Que moduloCantidadDeNumeros == 0
			2:
				Repetir
					Limpiar Pantalla
					Escribir "Ingrese la llave, separando cada número con un espacio"
					Leer textoIngresado
					
					//Establecer longitud del mensaje
					cantidadDeNumeros = 1
					limiteCadena = Longitud(textoIngresado)
					Para puntero = 1 Hasta limiteCadena Con Paso 1 Hacer
						lectorCaracter = Subcadena(textoIngresado,puntero,puntero)
						Si lectorCaracter == " " Entonces
							cantidadDeNumeros = cantidadDeNumeros + 1
						FinSi
					Fin Para
					
					Si CantidadDeNumeros == 9 Entonces
						
						//Leer llave y su transpuesta
						puntero = 1
						marcador1 = 1
						textoIngresado = concatenar(textoIngresado," ")
						Para fila = 1 Hasta 3 Con Paso 1 Hacer
							Para columna = 1 Hasta 3 Con Paso 1 Hacer
								Repetir
									lectorCaracter = Subcadena(textoIngresado,puntero,puntero)
									puntero = puntero + 1
								Hasta Que (lectorCaracter == " ")
								marcador2 = puntero - 2
								llave(fila,columna) = ConvertirANumero(Subcadena(textoIngresado,marcador1,marcador2))
								llaveTranspuesta(columna,fila) = llave(fila,columna)
								marcador1 = puntero
							Fin Para
						Fin Para
						
						//Calcular determinante de la llave
						determinante = ((llaveTranspuesta(1,1)*llaveTranspuesta(2,2)*llaveTranspuesta(3,3))+(llaveTranspuesta(2,1)*llaveTranspuesta(3,2)*llaveTranspuesta(1,3))+(llaveTranspuesta(1,2)*llaveTranspuesta(2,3)*llaveTranspuesta(3,1)))-((llaveTranspuesta(1,3)*llaveTranspuesta(2,2)*llaveTranspuesta(3,1))+(llaveTranspuesta(1,2)*llaveTranspuesta(2,1)*llaveTranspuesta(3,3))+(llaveTranspuesta(2,3)*llaveTranspuesta(3,2)*llaveTranspuesta(1,1)))
						
						//Calcular adjunta de la transpuesta de la matriz
						llaveTranspuestaAdjunta(1,1) = (llaveTranspuesta(2,2)*llaveTranspuesta(3,3))-(llaveTranspuesta(2,3)*llaveTranspuesta(3,2))
						llaveTranspuestaAdjunta(1,2) = -((llaveTranspuesta(2,1)*llaveTranspuesta(3,3))-(llaveTranspuesta(2,3)*llaveTranspuesta(3,1)))
						llaveTranspuestaAdjunta(1,3) = (llaveTranspuesta(2,1)*llaveTranspuesta(3,2))-(llaveTranspuesta(2,2)*llaveTranspuesta(3,1))
						llaveTranspuestaAdjunta(2,1) = -((llaveTranspuesta(1,2)*llaveTranspuesta(3,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(3,2)))
						llaveTranspuestaAdjunta(2,2) = (llaveTranspuesta(1,1)*llaveTranspuesta(3,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(3,1))
						llaveTranspuestaAdjunta(2,3) = -((llaveTranspuesta(1,1)*llaveTranspuesta(3,2))-(llaveTranspuesta(1,2)*llaveTranspuesta(3,1)))
						llaveTranspuestaAdjunta(3,1) = (llaveTranspuesta(1,2)*llaveTranspuesta(2,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(2,2))
						llaveTranspuestaAdjunta(3,2) = -((llaveTranspuesta(1,1)*llaveTranspuesta(2,3))-(llaveTranspuesta(1,3)*llaveTranspuesta(2,1)))
						llaveTranspuestaAdjunta(3,3) = (llaveTranspuesta(1,1)*llaveTranspuesta(2,2))-(llaveTranspuesta(1,2)*llaveTranspuesta(2,1))
						
						//Calcular inversa de la llave
						para fila = 1 Hasta  3 Con Paso 1 Hacer
							para columna = 1 Hasta  3 Con Paso 1 Hacer
								llaveInversa(fila,columna) = llaveTranspuestaAdjunta(fila,columna)/determinante
							FinPara
						FinPara
						
					SiNo
						Escribir "Llave inválida"
						Esperar 1 Segundos
					FinSi
				Hasta Que CantidadDeNumeros = 9
			3:
				
			De Otro Modo:
				Escribir "Opción inválida"
		FinSegun
	Fin Mientras
FinAlgoritmo
