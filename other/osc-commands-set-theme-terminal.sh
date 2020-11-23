# https://sw.kovidgoyal.net/kitty/faq.html#how-do-i-change-the-colors-in-a-running-kitty-instance
# https://invisible-island.net/xterm/ctlseqs/ctlseqs.html#h3-Operating-System-Commands
# https://github.com/dexpota/kitty-themes

# Change the default foreground color:
printf '\x1b]10;#FCFCAFAF3E3E\x1b\\'

# Change the default background color:
printf '\x1b]11;#050502020000\x1b\\'

# Change the default bold color:
printf '\x1b]5;0;#FCFCE9E94F4F\x1b\\'

# Change the default underline color:
#printf '\x1b]5;1;#FCFCE9\x1b\\'

# Change the default blink color:
#printf '\x1b]5;2;#FCFCE9\x1b\\'

# Change the default reverse color:
#printf '\x1b]5;3;#FCFCE9\x1b\\'

# Change the default italic color:
#printf '\x1b]5;4;#FCFCE9\x1b\\'

# Change the cursor color:
printf '\x1b]12;#844100\x1b\\'  # #F5F579790000

# Change the selection background color:
printf '\x1b]17;#FCFCAFAF3E3E\x1b\\'

# Change the selection foreground color:
printf '\x1b]19;#050502020000\x1b\\'

# Change the nth color (0 - 255):
#              n;color
printf '\x1b]4;0;#000000\x1b\\'  # Color 0
printf '\x1b]4;1;#CC0000\x1b\\'  # Color 1
printf '\x1b]4;2;#4D9A05\x1b\\'  # Color 2
printf '\x1b]4;3;#C3A000\x1b\\'  # Color 3
printf '\x1b]4;4;#3464A3\x1b\\'  # Color 4
printf '\x1b]4;5;#754F7B\x1b\\'  # Color 5
printf '\x1b]4;6;#05979A\x1b\\'  # Color 6
printf '\x1b]4;7;#D3D6CF\x1b\\'  # Color 7

printf '\x1b]4;8;#545652\x1b\\'  # Color 8
printf '\x1b]4;9;#EF2828\x1b\\'  # Color 9
printf '\x1b]4;10;#89E234\x1b\\' # Color 10
printf '\x1b]4;11;#FBE84F\x1b\\' # Color 11
printf '\x1b]4;12;#729ECF\x1b\\' # Color 12
printf '\x1b]4;13;#AC7EA8\x1b\\' # Color 13
printf '\x1b]4;14;#34E2E2\x1b\\' # Color 14
printf '\x1b]4;15;#EDEDEB\x1b\\' # Color 15

