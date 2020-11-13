#!/bin/bash

HISTORY_FILE="/Users/hleskine/.zhistory"
TARGET_FILE="/Users/heikki/Google Drive/Documents/notes/Shell command worth of remembering.md"

usage() { echo "Usage: $0 [-c <string>] [-i]" 1>&2; exit 1; }

comment=""

while getopts ":c:i" arg; do
	case "${arg}" in 
		c) 
			comment=${OPTARG}
			;;
		i)
			important=true
			;;
		*)
			usage
			;;
	esac
done
shift $((OPTIND-1))

command=$(tail -2  ~/.zhistory | head -1 | awk -F ";" '{print $2}')

# append the to the markdown file
line="${comment}
\`\`\`bash
${command}
\`\`\`
"

echo "${line}" >> "${TARGET_FILE}"

