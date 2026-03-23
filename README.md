# Curso de introducción a Julia
David Gómez-Castro (UAM)

Marzo 2025. Universidad Complutense de Madrid

[gomezcastro.xyz/courses/julia](https://www.gomezcastro.xyz/courses/julia)

## Estructura del curso:

01. Introducción.
    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/01-Introduccion-apuntes.html)
    
    - [Ejercicios 1a.](ejercicios/01a-PrimerContacto-ejercicios.ipynb)

    - [Ejercicios 1b.](ejercicios/01b-TiposDatos-Logica-ejercicios.ipynb)

    - [Ejercicios 1c.](ejercicios/01c-Funciones-ejercicios.ipynb)


02. Paquetes de `julia` para matemáticas

    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/02-Matematicas-apuntes.html)

03. Programación eficiente con `julia`

    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/03-Eficiencia-apuntes.html)

04. Entornos y paquetes: qué es un paquete de julia, cómo crearlos, y algunos paquetes útiles

- [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/04-EntornosPaquetes-apuntes.html)


### Configuración para las aulas de informática UCM

En Windows ejecute en una terminal
```{powershell}
winget install --name Julia --id 9NJNWW8PVKMN -e -s msstore
```

Para instalar `jupyter` introduzca en una terminal de `julia`
```{julia}
using Pkg; Pkg.add("IJulia")
```

Para ejecutarlo
```{julia}
using IJulia; notebook()
```

La primera vez pedirá instalar otros paquetes. Acepte introduciendo `y`.