# Mandelbrot in Bash

This repository contains a bash implementation for generating visualizations of the Mandelbrot set. 

It can render the Mandelbrot set directly to the terminal as ASCII art or produce a data file for `gnuplot` to generate a high-resolution PNG image.

### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.
Single Thread/Multi-thread shows the number of seconds it takes to do a 5000x5000 calculation.

| Language    | Repository                                                           | Single Thread   | Multi-Thread | Simd | Multi-Thread + Simd |
| :--------   | :------------------------------------------------------------------- | ---------------:| -----------: | ----:| ------------------: |
| Awk         | [mandelbrot-awk](https://github.com/jesper-olsen/mandelbrot-awk)     |           146.3 |              |      |                     |
| **Bash**    | [mandelbrot-bash](https://github.com/jesper-olsen/mandelbrot-bash)   |         10187.3 |              |      |                     |
| C           | [mandelbrot-c](https://github.com/jesper-olsen/mandelbrot-c)         |             3.6 |          0.6 |  0.7 |               0.2   |
| C++         | [mandelbrot-cpp](https://github.com/jesper-olsen/mandelbrot-cpp)     |             3.7 |          0.6 |  0.7 |               0.2   |
| Erlang      | [mandelbrot_erl](https://github.com/jesper-olsen/mandelbrot_erl)     |            35.6 |          8.3 |      |                     |
| Fortran     | [mandelbrot-f](https://github.com/jesper-olsen/mandelbrot-f)         |             4.5 |              |      |                     |
| Go          | [mandelbrot-go](https://github.com/jesper-olsen/mandelbrot-go)       |             4.1 |          0.8 |  1.3 |               0.4   |
| Lua         | [mandelbrot-lua](https://github.com/jesper-olsen/mandelbrot-lua)     |            33.2 |              |      |                     |
| Mojo        | [mandelbrot-mojo](https://github.com/jesper-olsen/mandelbrot-mojo)   |             3.8 |          1.2 |  0.7 |               0.4   |
| Nushell     | [mandelbrot-nu](https://github.com/jesper-olsen/mandelbrot-nu)       |   (est) 17186.6 |              |      |                     |
| Odin        | [mandelbrot-odin](https://github.com/jesper-olsen/mandelbrot-odin)   |             4.4 |              |      |                     |
| Python      | [mandelbrot-py](https://github.com/jesper-olsen/mandelbrot-py)       |     (pure) 93.3 | (jax)    5.9 |      |                     |
| R           | [mandelbrot-R](https://github.com/jesper-olsen/mandelbrot-R)         |           335.0 |              |      |                     |
| Rust        | [mandelbrot-rs](https://github.com/jesper-olsen/mandelbrot-rs)       |             4.7 |          1.3 |  1.4 |               0.8   |
| Swift       | [mandelbrot-swift](https://github.com/jesper-olsen/mandelbrot-swift) |             4.5 |          1.2 |  1.3 |               0.7   |
| Tcl         | [mandelbrot-tcl](https://github.com/jesper-olsen/mandelbrot-tcl)     |           306.9 |              |      |                     |
| Zig         | [mandelbrot-zig](https://github.com/jesper-olsen/mandelbrot-zig)     |             4.9 |          0.9 |  0.7 |               0.3   |



---

## Prerequisites

You will need the following installed:

1.  **Bash** - (e.g. 5.3).
2.  **Gnuplot** (required *only* for generating PNG images).

---


## Usage

The script can be configured via command-line arguments using a `key=value` format.

### 1. ASCII Art Output

To render the Mandelbrot set directly in your terminal, run the executable.

```sh
% ./mandelbrot.bash width=100 height=75

                                                                                .


                                                                              ..

                                                                               .
                                                                               . .
                       .                                                        .
                                                                               .
                                                                              .  .      .
                                                                                     . .....
                                                                                 .        .
                                                                                   .      .. . .
                                                                                              ..
 .
  .                                                                                            .
                         _
                                                                                             . .
  _                      .                                                                     _M.
                          .                                                                    .M.
       .               .. .                                                                   ._. ..
   .. ..             . ..                                                                 .  .    ..
     .MM.             .                  . .                                                      ._
     ..M.. .                          .                                                   .        .
      ..   .  .     ...                 .
    ...     . .     ..                 .
    .   .    ...    .
    .        ..... .                    ..
             .   ...   .    .                                                                    .._
                   ..                   .                                                  .    _a..
                   ....     .            .                                              ._  a    .._
                   .....  ...         ....                                                ..a.   .._
                   .... .  .. .       ..._     .                .               ..    ..  a__......_
                   .._...  _...        .                                         .  ._..._._....aa.W
                    ..._......        .. .   .                ..                  .    ....__._.M_WM
                    ..2M.__a.   .      _....                                      .    .  .._a_MMMMM
               ..  ...MM2___..  .     ..._ ...                                         .  M.2MMMMMMM
                ......MMMMM._2  ... .  ._.                    .        .                  ._MMMMMMMM
                ._aa_aMMMMMM..W.._. ...__.                     . . .                     .__aMMMMMMM
             ..a_...2MMMMMMM..a._a..._..M._     .                 ...  ..  .             .2._MMMMMMM
            .  a   ..MMMMMMM...M_M_W_.M_M..    .                  .a_..a  _          _  ..M_MMMMMMMM
                   ._MMMMMMaMMMMMMaM.MMM_.2    .                   ._..W.             __..a_MMMMMMMM
                 ...a_MMMMMMMMMMMMMMMaMMM2.  ...                    .._a_.__   .          _.MMMMMMMM
                   ...._MMMMMMMMMMMMMMMMM.a ...                   .._____.2a   .          ._MMMMMMMM
    .        .   _..._WMMMMMMMMMMMMMMMMMa.......               _ _.a.._a...     ..       ..._MMMMMMM
       ..      .._..MMMMMMMMMMMMMMMMMMMMMMa....2.       .         ....aM_._.    .a_..     ..aMMMMMMM
        . _    ...__aMMMMMMMMMMMMMMMMMMMMM__.__         .           .aMMMaMM. M.M2Ma. W.  ._.aMMMMMM
         _.     ..MMMMMMMMMMMMMMMMMMMMMMMMMMM_                    .._2aMMMMM.  .__W_..aM......_MMMMM
          ..   ..._2MMMMMMMMMMMMMMMMMMMMMMMMa..          .  .    .Wa_WMMMMM2.a..MMMM.._M.2M.a.._MMMM
         ...  _..W2MMMMMMMMMMMMMMMMMMMMMMMMM_.a.         ._._ .   .M_MMMMMMM.MM.MMMM.MMMaaMaM2MMMMMM
      . ._.....W..2MMMMMMMMMMMMMMMMMMMMMMMMMM...         .._aW2_  ..2MMMMMMM..MWMMMMMMMMMMMMMMMMMMMM
    . .a. ._..a_MaMMMMMMMMMMMMMMMMMMMMMMMMMMMW.          ._MW_.......2MMMMM_aMMMMMMMMMMMMMMMMMMMMMMM
    . ..   ..aaMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_...   .    .a.MMM..2M.a.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    ...     ._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_M.     2. ...2MMM_.MM_2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 .   .     ..._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM..     .2_M.._MMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           . ...._MMMMMMMMMMMMMMMMMMMMMMMMMMM_W.     __MM.2.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      .   .   ...aMMMMMMMMMMMMMMMMMMMMMMMMMMMM_. ..aM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               ..MMMMMMMMMMMMMMMMMMMMMMMMMMMM2..a..M_W_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            . ....MMMMMMMMMMMMMMMMMMMMMMMMMMM....M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           ..._.._aMMMMMMMMMMMMMMMMMMMMMMMMM_..MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
             __._WMMMMMMMMMMMMMMMMMMMMMMMMMWM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            ..._2MMaMMMMMMMMMMMMMMMMMMMMMMM_._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           a._ ._.._MMMMMMMMMMMMMMMMMMMMMMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            ._   ..._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        .. .     2_.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        ...     . .Ma_WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                 a_..2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                 .  ...._M2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               _.    .2._._a_MM___MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                    .  ....M...MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ...._.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ..2._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                       M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                   _2...M_2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
```


### 2. PNG Image Generation

To create a high-resolution PNG, you first generate a data file and then process it with `gnuplot`.


```sh
./mandelbrot.bash width=1000 height=750 png=1>image.txt
gnuplot topng.gp
open mandelbrot.png
```
![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-awk/main/mandelbrot.png)


## Performance

Benchmarks were run on an **Apple M5** system with GNU bash, version 3.2.57(1)-release (arm64-apple-darwin25)

**Generating a 1000x750 data file:**

```sh
time ./mandelbrot.bash width=1000 height=750 png=1 > image.txt  
291.52s user 1.42s system 99% cpu 4:54.38 total
```


**Generating a 5000x5000 data file:**

```sh
time ./mandelbrot.bash width=5000 height=5000 png=1 > image.txt  
10027.70s user 37.41s system 98% cpu 2:49:47.26 total
```


