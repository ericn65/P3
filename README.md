PAV - P3: detección de pitch
============================

Esta práctica se distribuye a través del repositorio GitHub [Práctica 3](https://github.com/albino-pav/P3).
Siga las instrucciones de la [Práctica 2](https://github.com/albino-pav/P2) para realizar un `fork` de la
misma y distribuir copias locales (*clones*) del mismo a los distintos integrantes del grupo de prácticas.

Recuerde realizar el *pull request* al repositorio original una vez completada la práctica.

Ejercicios básicos
------------------

- Complete el código de los ficheros necesarios para realizar la detección de pitch usando el programa
  `get_pitch`.

   * Complete el cálculo de la autocorrelación e inserte a continuación el código correspondiente.
	La autocorrelación es una operación matemática consistente en correlar una señal con ella misma desplazada. Los valores que
	no pertenecen los dejamos en "zero-padding".

   * Inserte una gŕafica donde, en un *subplot*, se vea con claridad la señal temporal de un sonido sonoro
     y su periodo de pitch; y, en otro *subplot*, se vea con claridad la autocorrelación de la señal y la
	 posición del primer máximo secundario.


	 NOTA: es más que probable que tenga que usar Python, Octave/MATLAB u otro programa semejante para
	 hacerlo. Se valorará la utilización de la librería matplotlib de Python.
	 
		 Hemos realizado este apartado con MATLAB con el siguiente código: 

		 Para programarlo se han usado funciones propias de la librería "Audio toolbox" de MATLAB. 

		 <img src="matlab1.jpeg" width="640" align="center">	

   * Determine el mejor candidato para el periodo de pitch localizando el primer máximo secundario de la
     autocorrelación. Inserte a continuación el código correspondiente.
     
     		Para determinar el valor hemos usado los valores deducibles de las lecturas para realizar la práctica y de las 
		gráficas que nos presenta matlab i wavesurfer.
		
		{CODI}

   * Implemente la regla de decisión sonoro o sordo e inserte el código correspondiente.


- Una vez completados los puntos anteriores, dispondrá de una primera versión del detector de pitch. El 
  resto del trabajo consiste, básicamente, en obtener las mejores prestaciones posibles con él.

	Para conseguir los mejores valores posibles para nuestro código hemos cogido los valores igual que en el apartado anterior.
	Para ajustarlos aún más, alrededor de los valores calculados hemos ido subiendo o bajándolos en un margen lógico para 
	mejorar el rendimiento de nuestro código, ya que los cáclulos y visionados de lecturas y gráficas no son los mismos que en 
	la práctica.
	
	{CODI}

  * Utilice el programa `wavesurfer` para analizar las condiciones apropiadas para determinar si un
    segmento es sonoro o sordo. 
	
	  - Inserte una gráfica con la detección de pitch incorporada a `wavesurfer` y, junto a ella, los 
	    principales candidatos para determinar la sonoridad de la voz: el nivel de potencia de la señal
		(r[0]), la autocorrelación normalizada de uno (r1norm = r[1] / r[0]) y el valor de la
		autocorrelación en su máximo secundario (rmaxnorm = r[lag] / r[0]).

		Puede considerar, también, la conveniencia de usar la tasa de cruces por cero.

	    Recuerde configurar los paneles de datos para que el desplazamiento de ventana sea el adecuado, que
		en esta práctica es de 15 ms.

	<img src="wavesurfer1.jpeg" width="640" align="center">	

      - Use el detector de pitch implementado en el programa `wavesurfer` en una señal de prueba y compare
	    su resultado con el obtenido por la mejor versión de su propio sistema.  Inserte una gráfica
		ilustrativa del resultado de ambos detectores.
  		
		<img src="wavesurfer2.jpeg" width="640" align="center">	

		Adjuntamos dos gráficas, la original y una editada donde se ve la correspondencia de los lóbulos de la función 
		calculada por nosotros y el "pitch contour" de wavesurfer. Hay un offset entre ambas, mas claramente se observa
		la correspondencia, tanto por tamaño como por variación de los picos que ofrece "pitch contour".
		
  		
  
  * Optimice los parámetros de su sistema de detección de pitch e inserte una tabla con las tasas de error
    y el *score* TOTAL proporcionados por `pitch_evaluate` en la evaluación de la base de datos 
	`pitch_db/train`..

   * Inserte una gráfica en la que se vea con claridad el resultado de su detector de pitch junto al del
     detector de Wavesurfer. Aunque puede usarse Wavesurfer para obtener la representación, se valorará
	 el uso de alternativas de mayor calidad (particularmente Python).
   

Ejercicios de ampliación
------------------------

- Usando la librería `docopt_cpp`, modifique el fichero `get_pitch.cpp` para incorporar los parámetros del
  detector a los argumentos de la línea de comandos.
  
  Esta técnica le resultará especialmente útil para optimizar los parámetros del detector. Recuerde que
  una parte importante de la evaluación recaerá en el resultado obtenido en la detección de pitch en la
  base de datos.

  * Inserte un *pantallazo* en el que se vea el mensaje de ayuda del programa y un ejemplo de utilización
    con los argumentos añadidos.

- Implemente las técnicas que considere oportunas para optimizar las prestaciones del sistema de detección
  de pitch.

  Entre las posibles mejoras, puede escoger una o más de las siguientes:

  * Técnicas de preprocesado: filtrado paso bajo, *center clipping*, etc.
  {CODI}
  	*LPF*: usar un filtro paso bajo lineal nos empeora la detección, ya que "se come" muchas frecuencias necesarias para
	distinguir entre sonidos. 
	Código de nuestra implementación NO usada en el programa definitivo:
	
	*Center Clipping*: esta técnica nos dá una mejora visible de resultado. El código usado es el siguiente:

	
  * Técnicas de postprocesado: filtro de mediana, *dynamic time warping*, etc.
  
  	*Median filter*: para terminar de mejorar nuestro programa hemos querido usar un filtro de mediana. Al tratarse de un 
	filtro paso bajo no lineal consideramos que mejora suficiente nuestro código para ser implementado en la versión final.
	{CODI}
	Para programarlo nos hemos basado en el conocimiento de clase y estas 2 webs:
	https://www.geeksforgeeks.org/noise-removal-using-median-filter-in-c/
	http://ceur-ws.org/Vol-1543/p1.pdf
	
  * Métodos alternativos a la autocorrelación: procesado cepstral, *average magnitude difference function*
    (AMDF), etc.
  * Optimización **demostrable** de los parámetros que gobiernan el detector, en concreto, de los que
    gobiernan la decisión sonoro/sordo.
  * Cualquier otra técnica que se le pueda ocurrir o encuentre en la literatura.

  Encontrará más información acerca de estas técnicas en las [Transparencias del Curso](https://atenea.upc.edu/pluginfile.php/2908770/mod_resource/content/3/2b_PS Techniques.pdf)
  y en [Spoken Language Processing](https://discovery.upc.edu/iii/encore/record/C__Rb1233593?lang=cat).
  También encontrará más información en los anexos del enunciado de esta práctica.

  Incluya, a continuación, una explicación de las técnicas incorporadas al detector. Se valorará la
  inclusión de gráficas, tablas, código o cualquier otra cosa que ayude a comprender el trabajo realizado.

  También se valorará la realización de un estudio de los parámetros involucrados. Por ejemplo, si se opta
  por implementar el filtro de mediana, se valorará el análisis de los resultados obtenidos en función de
  la longitud del filtro.
   

Evaluación *ciega* del detector
-------------------------------
Los resultados finales de nuestro detector tras la realización de los ejercicios es:
Si usamos un filtro de mediana con 3 muestras el gross voiced errors da:
### Summary
Num. frames:	11200 = 7045 unvoiced + 4155 voiced
Unvoiced frames as voiced:  	251/7045 (3.56 %)
Voiced frames as unvoiced:  	422/4155 (10.16 %)
Gross voiced errors (+20.00 %): 219/3733 (5.87 %)
MSE of fine errors: 	2.95 %

===>	TOTAL:  89.66 %
--------------------------

Si usamos un filtro de mediana con 5 muestras el gross voiced errors da:
### Summary
Num. frames:	11200 = 7045 unvoiced + 4155 voiced
Unvoiced frames as voiced:  	244/7045 (3.46 %)
Voiced frames as unvoiced:  	427/4155 (10.28 %)
Gross voiced errors (+20.00 %): 186/3728 (4.99 %)
MSE of fine errors: 	3.31 %

===>	TOTAL:  89.50 %
--------------------------

Pudiendo concluir que el tamaño óptimo del filtro de mediana es 3. 



Antes de realizar el *pull request* debe asegurarse de que su repositorio contiene los ficheros necesarios
para compilar los programas correctamente ejecutando `make release`.

Con los ejecutables construidos de esta manera, los profesores de la asignatura procederán a evaluar el
detector con la parte de test de la base de datos (desconocida para los alumnos). Una parte importante de
la nota de la práctica recaerá en el resultado de esta evaluación.
