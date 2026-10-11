# Mandelbrot in Bash

Mandelbrot in Bourne-style shells: Bash, Zsh and Korn.

The shell scripts can render the Mandelbrot set directly to the terminal as ASCII art or produce a data file for `gnuplot` to generate a high-resolution PNG image.

### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.
Single Thread/Multi-thread shows the number of seconds it takes to do a 5000x5000 calculation.

| Language                                                       | Single Thread   | Multi-Thread | Simd | Multi-Thread + Simd |
| :------------------------------------------------------------- | ---------------:| -----------: | ----:| ------------------: |
| [Awk](https://github.com/jesper-olsen/mandelbrot-awk)          |           146.3 |              |      |                     |
| [Bash5.3](https://github.com/jesper-olsen/mandelbrot-bash)     |         10187.3 |              |      |                     |
| [Zsh](https://github.com/jesper-olsen/mandelbrot-bash)         |          2683.6 |              |      |                     |
| [Ksh (93u+m)](https://github.com/jesper-olsen/mandelbrot-bash) |          1271.5 |              |      |                     |
| [C](https://github.com/jesper-olsen/mandelbrot-c)              |             3.6 |          0.6 |  0.7 |               0.2   |
| [C++](https://github.com/jesper-olsen/mandelbrot-cpp)          |             3.7 |          0.6 |  0.7 |               0.2   |
| [Erlang](https://github.com/jesper-olsen/mandelbrot_erl)       |            35.6 |          8.3 |      |                     |
| [Fortran](https://github.com/jesper-olsen/mandelbrot-f)        |             4.5 |              |      |                     |
| [Go](https://github.com/jesper-olsen/mandelbrot-go)            |             4.1 |          0.8 |  1.3 |               0.4   |
| [Lua](https://github.com/jesper-olsen/mandelbrot-lua)          |            33.2 |              |      |                     |
| [Mojo](https://github.com/jesper-olsen/mandelbrot-mojo)        |             3.8 |          1.2 |  0.7 |               0.4   |
| [Nu](https://github.com/jesper-olsen/mandelbrot-nu)            |   (est) 17186.6 |              |      |                     |
| [Odin](https://github.com/jesper-olsen/mandelbrot-odin)        |             4.4 |              |      |                     |
| [Py](https://github.com/jesper-olsen/mandelbrot-py)            |     (pure) 93.3 | (jax)    5.9 |      |                     |
| [R](https://github.com/jesper-olsen/mandelbrot-R)              |           335.0 |              |      |                     |
| [Rust](https://github.com/jesper-olsen/mandelbrot-rs)          |             4.7 |          1.3 |  1.4 |               0.8   |
| [Swift](https://github.com/jesper-olsen/mandelbrot-swift)      |             4.5 |          1.2 |  1.3 |               0.7   |
| [Tcl](https://github.com/jesper-olsen/mandelbrot-tcl)          |           306.9 |              |      |                     |
| [Zig](https://github.com/jesper-olsen/mandelbrot-zig)          |             4.9 |          0.9 |  0.7 |               0.3   |



---

## Prerequisites

You will need one or more of the following installed:

1. [bash](https://www.gnu.org/software/bash/) 
2. [zsh](https://www.zsh.org/) 
3. [ksh93](https://github.com/ksh93/ksh) 
4.  **Gnuplot** (required *only* for generating PNG images).

---


## Usage

The scripts can be configured via command-line arguments using a `key=value` format.

### 1. ASCII Art Output

To render the Mandelbrot set directly in your terminal, run one of the scripts (.bash, .zsh, .ksh):

```sh
./mandelbrot.zsh width=100 height=75

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

Benchmarks were run on an **Apple M5** system with:

* GNU bash, version 3.2.57(1)-release (arm64-apple-darwin25)  (MacOs default).
* GNU bash, version 5.3.20(1)-release (aarch64-apple-darwin25.6.0).
* zsh 5.9 (arm64-apple-darwin25.0)
* ksh version sh (AT&T Research) 93u+ 2012-08-01
* ksh93 version sh (AT&T Research) 93u+m/1.0.10 2024-08-01

**Generating a 1000x750 data file:**

Bash 3.2

```sh
time bash32 mandelbrot.bash width=1000 height=750 png=1 > image.txt  
599.40s user 27.98s system 98% cpu 10:34.33 total
```

Bash 5.3

```sh
time bash53 mandelbrot.bash width=1000 height=750 png=1 > image.txt
296.96s user 1.52s system 99% cpu 5:00.88 total
```

Zsh

```sh
time ./mandelbrot.zsh width=1000 height=750 png=1 > image.txt
74.59s user 2.30s system 97% cpu 1:18.89 total
```

Old AT&T Ksh

```sh
time ./mandelbrot.ksh width=1000 height=750 png=1 > image.txt
38.88s user 0.47s system 94% cpu 41.470 total
```

Ksh93

```sh
time ksh93 mandelbrot.ksh width=1000 height=750 png=1 > image.txt
36.06s user 0.24s system 98% cpu 36.715 total
```

**Generating a 5000x5000 data file:**

Bash 5.3

```sh
time bash53 mandelbrot.bash width=5000 height=5000 png=1 > image.txt  
10027.70s user 37.41s system 98% cpu 2:49:47.26 total
```

Zsh

```sh
time ./mandelbrot.zsh width=5000 height=5000 png=1 > image.txt  
2578.77s user 73.09s system 98% cpu 44:43.58 total
```

Ksh93

```sh
time ksh93 ./mandelbrot.ksh width=5000 height=5000 png=1 > image.txt
1246.00s user 7.58s system 98% cpu 21:11.51 total
```
