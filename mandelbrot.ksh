#!/usr/bin/env ksh
# Mandelbrot in ksh93, native floating point. Usage: ./mandelbrot.ksh [width=N] [height=N] [png=1]

float ll_x=-1.2 ll_y=0.20 ur_x=-1.0 ur_y=0.35
integer max_iter=255 width=100 height=75 png=0
float real=0 imag=0
integer value=0

# Reads globals real/imag; `function name {` syntax gives ksh93 local scope.
function escape_time {
    float zr=0 zi=0 tmp
    integer n
    for (( n = 0; n < max_iter && zr*zr + zi*zi <= 4; n++ )); do
        (( tmp = zr*zr - zi*zi + real, zi = 2*zr*zi + imag, zr = tmp ))
    done
    (( value = max_iter - n ))
}

function main {
    typeset arg row symbols="MW2a_. "
    integer x y
    float fwidth fheight
    for arg in "$@"; do
        case $arg in
            width=*)  width=${arg#width=} ;;
            height=*) height=${arg#height=} ;;
            png=*)    png=${arg#png=} ;;
            *) print -u2 "usage: $0 [width=N] [height=N] [png=1]"; return 1 ;;
        esac
    done
    (( fwidth = ur_x - ll_x, fheight = ur_y - ll_y ))

    if (( png == 0 )); then
        for (( y = 0; y < height; y++ )); do
            row=""
            for (( x = 0; x < width; x++ )); do
                (( real = ll_x + x * fwidth / width, imag = ur_y - y * fheight / height ))
                escape_time
                row+=${symbols:value*7/max_iter:1}
            done
            print -r -- "$row"
        done
    else
        for (( y = height; y > 0; y-- )); do
            row=""
            for (( x = 0; x < width; x++ )); do
                (( real = ll_x + x * fwidth / width, imag = ur_y - y * fheight / height ))
                escape_time
                (( x > 0 )) && row+=", "
                row+=$value
            done
            print -r -- "$row"
        done
    fi
}

main "$@"
