#!/usr/bin/env bash
#
# Mandelbrot set in pure bash, using fixed-point integer arithmetic.
#
# Usage: ./mandelbrot.bash [width=N] [height=N] [png=1]
#   default      ASCII art to stdout
#   png=1        gnuplot image matrix to stdout (render with topng.gp)

# Q4.28 fixed point: value = integer / 2^28.
# Headroom: |z| component stays below ~5.4 before the escape test, so
# products stay below ~2^61, inside signed 64-bit.
readonly F=28
readonly ONE=$(( 1 << F ))
readonly FOUR=$(( 4 << F ))
readonly MAX_ITER=255
readonly SYMBOLS="MW2a_. "

# View window: ll = lower left, ur = upper right
readonly LL_X=$(( -12 * ONE / 10 ))   # -1.2
readonly LL_Y=$((   2 * ONE / 10 ))   #  0.20
readonly UR_X=$(( -10 * ONE / 10 ))   # -1.0
readonly UR_Y=$((  35 * ONE / 100 ))  #  0.35
readonly FW=$(( UR_X - LL_X ))
readonly FH=$(( UR_Y - LL_Y ))

# Sets global `value` = MAX_ITER - iterations survived for c = (cr, ci).
# A global avoids the fork a $(...) call would cost per pixel.
escape_time() {
    local cr=$1 ci=$2 zr=0 zi=0 zr2 zi2 n
    for (( n = 0; n < MAX_ITER; n++ )); do
        (( zr2 = (zr * zr) >> F, zi2 = (zi * zi) >> F ))
        (( zr2 + zi2 > FOUR )) && break
        # zi uses the old zr, so update it first; 2*zr*zi == (zr*zi) >> (F-1)
        (( zi = ((zr * zi) >> (F - 1)) + ci, zr = zr2 - zi2 + cr ))
    done
    value=$(( MAX_ITER - n ))
}

ascii_output() {
    local x y real imag row
    for (( y = 0; y < height; y++ )); do
        imag=$(( UR_Y - y * FH / height ))
        row=""
        for (( x = 0; x < width; x++ )); do
            real=$(( LL_X + x * FW / width ))
            escape_time "$real" "$imag"
            row+=${SYMBOLS:value*7/MAX_ITER:1}
        done
        printf '%s\n' "$row"
    done
}

gptext_output() {
    local x y real imag row
    for (( y = height; y > 0; y-- )); do
        imag=$(( UR_Y - y * FH / height ))
        row=""
        for (( x = 0; x < width; x++ )); do
            real=$(( LL_X + x * FW / width ))
            escape_time "$real" "$imag"
            (( x > 0 )) && row+=", "
            row+=$value
        done
        printf '%s\n' "$row"
    done
}

main() {
    local width=100 height=75 png=0 arg
    for arg in "$@"; do
        case $arg in
            width=*)  width=${arg#width=} ;;
            height=*) height=${arg#height=} ;;
            png=*)    png=${arg#png=} ;;
            *) echo "usage: $0 [width=N] [height=N] [png=1]" >&2; return 1 ;;
        esac
    done
    [[ $width =~ ^[1-9][0-9]*$ && $height =~ ^[1-9][0-9]*$ && $png =~ ^[01]$ ]] || {
        echo "width/height must be positive integers, png 0 or 1" >&2
        return 1
    }

    if (( png == 0 )); then
        ascii_output
    else
        gptext_output
    fi
}

main "$@"
