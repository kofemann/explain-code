#!/bin/sh
#
# Simple utility to explore unknown code.
#
# Dependencies:
#   - access to LLM API
#   - chatgpt client https://github.com/kardolus/chatgpt-cli/
#   - glow to beautify the output https://github.com/charmbracelet/glow
#

MARKDOWN_HIGHLIGHER=/usr/bin/glow


if [ ! -f $MARKDOWN_HIGHLIGHER ]
then
  MARKDOWN_HIGHLIGHER=/usr/bin/tr '[a-z]' '[a-z]'
fi

if [ ! -f $1 ]
then
  echo "Usage: explain-code <file-name>"
  exit 1
fi

filename=`basename $1`
language=""

case $filename in
  *.py)
    language="Python"
    ;;
  *.java)
    language="Java"
    ;;
  *.js)
    language="Javascript"
    ;;
  *.c)
    language="C"
    ;;
  *.cpp|*.cc)
    language="C++"
    ;;
  *.cs)
    language="C#"
    ;;
  *.sh)
    language="UNIX-shell"
    ;;
  *.sql)
    language="SQL"
    ;;
esac


(cat $1 | OPENAI_API_KEY=${GH_LLM_KEY} \
        OPENAI_URL=https://models.inference.ai.azure.com \
        OPENAI_MODEL=gpt-4o-mini\
        OPENAI_COMPLETIONS_PATH=/chat/completions \
        OPENAI_ROLE="You are an experienced ${language} software developer." \
        ~/bin/chatgpt \
        "Explain provided ${language} file. Identify key algorithms and design patterns.
        Generate the output in markdown format."; echo '>NOTE: This is an AI-generated summary that can be **inaccurate of even wrong**.') \
        | $MARKDOWN_HIGHLIGHER
