# Dotfiles 💻

![captura de pantalla](https://i.ibb.co/19RZTNx/Screenshot-at-2021-12-20-19-50-20.png)

Esta es mi configuración actual de diversos programas. Solo incluyo los mas significantes. Están enfocados principalmente para estudios, escritura y, en menor medida, programación. 

## Instalación 🚀

Hay una carpeta con la configuración de cada programa. Se recomienda usar el paquete `stow` para facilitar la instalación.

Para usar stow correctamente, este repositorio debe ser contenido en una carpeta dentro del `$HOME`. Por ejemplo, en  `~/.dotfiles/`. Para instalar la configuración de, por ejemplo Vim y Zathura, se usa el comando

```bash
stow vim zathura
```

En caso de necesitar una instalación completa se usa

```bash
stow *
```

Ademas de los paquetes explícitos, serán necesarios paquetes extra que se usan dentro de las configuraciones. Algunos son: `fzf`, `xwallpaper`, `redshift`, `scrot`, `dmenu` y `pass`.

## Estética 🎨

Se ha tratado de aplicar de manera coherente una apariencia uniforme. Para esto se utilizo, siempre que fue posible, los colores de [Cosme](https://github.com/beikome/cosme.vim) y la fuente tipográfica [Iosevka](https://typeof.net/Iosevka/).

## Configuraciones 📋

### Scripts

Hay 3 scripts útiles dentro de la configuración. Para utilizarlos es necesario agregarlos al path 

```bash
PATH=$PATH:~/.local/bin/reaper/
```

Estos son los scripts y su función. 

| Nombre     | Descripción                                                                          |
|------------|--------------------------------------------------------------------------------------|
| `passmenu` | Muestra un menú de selección de contraseña. La seleccionada se copia al portapapeles |
| `emoji`    | Muestra un menú de selección de emojis. El seleccionado se copia al portapapeles     |
| `SS`       | Toma una captura de pantalla en modo de recorte y lo copia al portapapeles           |


### Spectrwm

El fondo de pantalla se configura automáticamente colocándolo en `~/.bg.png`. 

Hay algunos scripts que configuran partes del entorno. Estos se encuentran en `~/.config/spectrwm/`. Al iniciar el entorno se ejecuta automáticamente el script `autorun.sh`. En la parte superior derecha de la barra se muestra el contenido de `baraction.sh`. `togglekeyboard.sh` se llama desde un atajo de teclado (tabla siguiente).

Mantengo la mayoría de los atajos especificados en el manual (ver `man spectrwm`), solo hice algunos cambios menores. Esta tabla muestra la lista de atajos de teclado personalizados. En todos ellos `MOD` se refiere a la tecla `Alt`.

| Atajo                  | Descripción                                                       |
|------------------------|-------------------------------------------------------------------|
| `MOD + RETURN`         | Abre una terminal                                                 |
| `MOD + SHIFT + RETURN` | Abre una terminal en modo flotante para cosas rápidas             |
| `MOD + n`              | Enfoca el siguiente monitor                                       |
| `MOD + v`              | Cambia la distribución de teclado, de `en` a `latam`, y viceversa |

### Vim 

Toda la configuración de Vim está mas pensada para la escritura personal y académica, que para la escritura de código. Recomiendo revidar el código fuente, aquí solo mencionare algunas configuraciones.

Se incluyen dos esquemas de color: `cosme` como color estético por defecto, y `noctu` como esquema de color simple y altamente compatible con cualquier terminal.

Por defecto se configura usar 2 espacios al usar el tabulador, pero esto cambia en los lenguajes que requieren una atentación especifica. Por ejemplo en los Makefiles se cambia automáticamente a tabs reales.

Estos son los atajos extra que se añaden.

| Modo   | Atajo              | Descripción                                                     |
|--------|--------------------|-----------------------------------------------------------------|
| NORMAL | `<Leader><Leader>` | Abre un buscador de archivos (fzf)                              |
| NORMAL | `<C-j>`            | Cambia al siguiente buffer                                      |
| NORMAL | `<C-k>`            | Cambia al anterior buffer                                       |
| NORMAL | `<Leader>e`        | Abre el explorador de archivos (a modo de árbol)                |
| NORMAL | `<Leader>s`        | Activa y desactiva la ortografía del texto                      |
| NORMAL | `<Leader>c`        | Pone la ocultación de texto a nivel 2                           |
| NORMAL | `<Leader>C`        | Pone la ocultación de texto a nivel 0 (desactivada)             |
| NORMAL | `<Leader>r`        | Ejecuta el bloque de código (código en Markdown)                |
| NORMAL | `<Leader>R`        | Ejecuta el bloque de código e inserta la salida en el documento |
| NORMAL | `<Leader>t`        | Formatea tablas de Markdown                                     |
| INSERT | `<C-l>`            | Corrige orto gráficamente la ultima palabra mal escrita         |

Al usar el atajo del corrector ortográfico por primer vez, automáticamente se descargaran 3 diccionarios: Ingles, Español y Latín.
