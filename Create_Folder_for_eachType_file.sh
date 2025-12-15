#!/bin/bash
SOURCE="/home/aman/Downloads"
BASE_DEST="/home/aman/Downloads"

move_file() {
    DEST_FOLDER="$1"
    shift
    EXTENSIONS=("$@")

    DEST="$BASE_DEST/$DEST_FOLDER"

    [[ ! -d "$DEST" ]] && mkdir -p "$DEST"

    for ext in "${EXTENSIONS[@]}"
    do
        find "$SOURCE" -type f -iname "*.$ext" ! -path "$DEST/*" -exec mv -n {} "$DEST" \;
    done
}


move_file "Music" mp3 wav flac
move_file "Videos" mp4 mkv avi
move_file "Images" jpg jpeg png gif
move_file "Documents" pdf docx txt
move_file "Archives" zip tar.gz rar
move_file "Executables" exe sh bat
move_file "Presentations" ppt pptx
move_file "Spreadsheets" xls xlsx


echo "File organization completed ✅"
