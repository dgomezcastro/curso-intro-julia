# Instalación de `julia` 

Siguiendo las instrucciones de las notas, y una IDE:
```{bash}
$ curl -fsSL https://install.julialang.org | sh
``` 

Compruebe que funcione en una terminal:
```{bash}
$ julia
```

# Instalación de un gestor de libretas `.ipynb`

Aquí tenemos varias opciones:

- VSCode (recomendado): [link](https://code.visualstudio.com/docs/languages/julia)

- `Jupyter` (si ya está instalado en su máquina). Ejecute en `julia` las siguientes órdenes
``´{julia}
using Pkg
Pkg.add("IJulia")
```

Para comprobar que todo está bien configurado ejecute, abra la hoja 01 de ejercicios.