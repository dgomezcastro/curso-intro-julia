# Curso de introducción a Julia
David Gómez-Castro (UAM)

Marzo 2025. Universidad Complutense de Madrid

[gomezcastro.xyz/courses/julia](https://www.gomezcastro.xyz/courses/julia)

## Estructura del curso:

01. Qué es `julia` y algunos motivos para usarlo. Primer contacto.
    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/01-PrimerContacto-apuntes.html)
    
    - [Ejercicios](ejercicios/01-PrimerContacto-ejercicios.ipynb)

02. Tipos de datos y control de flujo

    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/02-TiposDatos-Logica-apuntes.html)

    - [Ejercicios](ejercicios/02-TiposDatos-Logica-ejercicios.ipynb)

03. Funciones. Multiple dispatch

    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/03-Funciones-apuntes.html)

    - [Ejercicios](ejercicios/03-Funciones-ejercicios.ipynb)

04. Entornos y paquetes: qué es un paquete de julia, cómo crearlos, y algunos paquetes útiles

    - [Apuntes](https://html-preview.github.io/?url=https://raw.githubusercontent.com/dgomezcastro/curso-intro-julia/refs/heads/main/apuntes/04-EntornosPaquetes-apuntes.html)

05. Paquetes de `julia` para matemáticas

06. Programación eficiente con `julia`

### Configuración para las aulas de informática UCM

En Windows ejecute en una terminal
```{powershell}
winget install julia -s msstore
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