#!/bin/bash
# Program to output a system information page

PROGNAME="$(basename "$0")"

usage () {
    cat <<- _EOF_
	Usage:
	    $PROGNAME
	        Output the report to the stdout.
	
	    $PROGNAME (-f | --file) <file>
	        Output the report to the given file.
	
	    $PROGNAME (-i | --interactive)
	        Get the output file interactively from the keyboard.
	
	    $PROGNAME (-h | --help)
	        Display this help message.
	_EOF_
    return
}

main () {
    # global aux vars
    interactive=''
    filename=''

    process_options "$@"
    interactive_mode
    output_html_page
}

process_options () {
    # process command line options
    while [[ -n "$1" ]]; do
        case "$1" in
            -f | --file)
                shift
                filename="$1"
                ;;
            -i | --interactive)
                interactive=1
                ;;
            -h | --help)
                usage
                exit
                ;;
            *)
                usage >&2
                exit 1
                ;;
        esac
        shift
    done
}

interactive_mode () {
    # interactive mode
    if [[ -n "$interactive" ]]; then
        while true; do
            read -p "Enter name of output file: " filename
            if [[ -e "$filename" ]]; then
                read -p "'$filename' exists. Overwrite? [y/n/q] > "
                case "$REPLY" in
                    Y|y)
                        break
                        ;;
                    Q|q)
                        echo "Program terminated."
                        exit
                        ;;
                    *)
                        continue
                        ;;
                esac
            elif [[ -z "$filename" ]]; then
                continue
            else
                break
            fi
        done
    fi
}

output_html_page () {
    # output html page
    if [[ -n "$filename" ]]; then
        if touch "$filename" && [[ -f "$filename" ]]; then
            write_html_page > "$filename"
        else
            echo "$PROGNAME: Cannot write file '$filename'" >&2
            exit 1
        fi
    else
        write_html_page
    fi
}

write_html_page () {
    local TITLE="System Information Report For $HOSTNAME"
    local CURRENT_TIME=$(date +"%x %r %Z")
    local TIMESTAMP="Generated on $CURRENT_TIME, by $USER"

    cat <<- _EOF_
	<html>
	    <head>
	        <title>$TITLE</title>
	    </head>
	    <body>
	        <h1>$TITLE</h1>
	        <p>$TIMESTAMP</p>
	        $(report_uptime)
	        $(report_disk_space)
	        $(report_home_space)
	    </body>
	</html>
	_EOF_
}

report_uptime() {
   cat <<- _EOF_
	<h2>System Uptime</h2>
	<pre>$(uptime)</pre>
	_EOF_
    return
}

report_disk_space() {
   cat <<- _EOF_
	<h2>Disk Space Utilization</h2>
	<pre>$(df -h .)</pre>
	_EOF_
    return
}

report_home_space () {
    local format="%8s%10s%10s\n"
    local i dir_list total_files total_dirs total_size user_name
    if [[ "$(id -u)" -eq 0 ]]; then
        dir_list=/home/*
        user_name="All Users"
    else
        dir_list="$PWD"
        user_name="$USER"
    fi
    echo "<h2>Home Space Utilization ($user_name)</h2>"
    for i in $dir_list; do
        total_files="$(find "$i" -type f | wc -l)"
        total_dirs="$(find "$i" -type d | wc -l)"
        total_size="$(du -sh "$i" | cut -f 1)"
        echo "<H3>$i</H3>"
        echo "<pre>"
        printf "$format" "Dirs" "Files" "Size"
        printf "$format" "----" "-----" "----"
        printf "$format" "$total_dirs" "$total_files" "$total_size"
        echo "</pre>"
    done
    return
}

# call the main function
main "$@"

