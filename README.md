# Curso de introducción a Julia
David Gómez-Castro (UAM)
Marzo 2025. Universidad Complutense de Madrid

## Estructura del curso:

01. Qué es `julia` y algunos motivos para usarlo. Primer contacto.

02. Tipos de datos y control de flujo

03. Funciones. Multiple dispatch

04. Paquetes: qué es un paquete de julia, cómo crearlos, y algunos paquetes útiles

05. Paquetes de `julia` para matemáticas

06. Programación eficiente con `julia`

## En las aulas de informática UCM

En Windows ejecute en una terminal
```{powershell}
winget install julia -s msstore
```

Para instalar `jupyter` introduzca en una terminal de `julia`
```{julia}
#| eval: false
using Pkg; Pkg.add("IJulia")
```

Para ejecutarlo
```{julia}
#| eval: false
using IJulia; notebook()
```

La primera vez pedirá instalar otros paquetes. Acepte introduciendo `y`.