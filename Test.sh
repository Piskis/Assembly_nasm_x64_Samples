#!/bin/bash 

files=$(ls *.asm 2>/dev/null)

selected_file=$(dialog --title "Файл для компиляции" --menu "Файлы в этой папке" 15 50 10 $(for f in $files; do echo "$f $f"; done) 2>&1 >/dev/tty) 

if [ $? -eq 0 ]; then 
  clear
  output_file="${selected_file%.asm}"

  nasm -f elf64 "$selected_file" -o "$output_file.o" 
  ld "$output_file.o" -o "$output_file"
  clear 
  Good_ending=$(dialog --title "Скомпилировано как $output_file" --menu "Что сделать теперь?" 10 40 2 \
    1 "Выйти" \
    2 "./$output_file" \
    3 "Открыть в Vim" 2>&1 >/dev/tty) 
  case $Good_ending in
    1) clear && echo "Выход без действий";;
    2) clear && ./"$output_file" ;;
    3) clear && vim "$selected_file";;
  esac 
else 
  clear
fi

