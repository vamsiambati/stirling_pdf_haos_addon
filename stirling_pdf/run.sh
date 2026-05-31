#!/bin/sh

JAR_PATH=""

for candidate in /app.jar /app/*.jar /opt/*.jar; do
	if [ -f "$candidate" ]; then
		JAR_PATH="$candidate"
		break
	fi
done

if [ -z "$JAR_PATH" ]; then
	echo "Error: Unable to locate Stirling-PDF jar. Checked: /app.jar, /app/*.jar, /opt/*.jar" >&2
	exit 1
fi

exec java -Dfile.encoding=UTF-8 -jar "$JAR_PATH"

