# Explain Code

A simple utility to explain given source code file using LLM

## Requirements

- LLM_API_KEY
- [chatgpt](https://github.com/kardolus/chatgpt-cli/) CLI client 
- [glow](https://github.com/charmbracelet/glow) CLI  to beautify the output (optional)

## Example
(eat your own dog food)

```shell
$ explain-code.sh explain-code.sh
```

Generated output

```markdown
   # Explanation of the Provided UNIX-Shell File                                                                        
                                                                                                                      
  The provided UNIX-shell script is a utility designed for the purpose of exploring and
  understanding unknown code files based on their file types. Below is a detailed breakdown
  of its functionality, key algorithms, and design patterns.                                                                                                           
                                                                                                                      
  ## Key Features of the Script                                                                                       
                                                                                                                      
  ### 1. Shebang and Comments                                                                                         
                                                                                                                      
  • The script begins with a shebang ( #!/bin/sh ), indicating that it should be executed
    in the Bourne shell.        
  • Comments are included at the top to describe the utility's purpose and dependencies.                              
                                                                                                                      
  ### 2. Dependencies                                                                                                 
                                                                                                                      
  • LLM API Access: The script requires access to a Language Model (LLM) API.                                         
  • ChatGPT Client: It uses a specific chat client to communicate with the API.                                       
  • Glow: This is a Markdown beautifier utilized for generating readable output.                                      
                                                                                                                      
  ### 3. Environment Variable for Markdown Highlighter                                                                
                                                                                                                      
  • The script sets a variable  MARKDOWN_HIGHLIGHER  to the path of the  glow  utility for
   beautifying Markdown output.                                                                                                             
  • If  glow  is not found, it falls back to using the  tr  command, which simply transforms
   text to lowercase, making it less visually appealing.                                                                                         
                                                                                                                      
  ### 4. File Existence Check                                                                                         
                                                                                                                      
  • The script checks if a filename is provided and if the file exists.                                               
  • If not present, it displays a usage message and exits.                                                            
                                                                                                                      
  ### 5. Language Detection                                                                                           
                                                                                                                      
  • The script extracts the base name of the provided file and checks its extension to determine
  the programming language. Supported languages include Python, Java, JavaScript, C, C++, C#,
  UNIX-shell, and SQL.                    
                                                                                                                      
  ### 6. Generating Code Explanation                                                                                  
                                                                                                                      
  • The core functionality involves passing the content of the specified file to a ChatGPT model via
   an API call.     
  • It constructs a request prompt asking for an explanation, identification of key algorithms, and
   design patterns in the file, formatted in Markdown.                                                                                    
                                                                                                                      
  ### 7. Output                                                                                                       
                                                                                                                      
  • Finally, the output from the API call is piped into the Markdown highlighter for improved
  readability before being displayed to the user.                                                                                              
                                                                                                                      
  ## Key Algorithms                                                                                                   
                                                                                                                      
  1. File Manipulation Algorithm:                                                                                     
    • Uses  basename  to extract the filename for determining the language and obtaining the
    filename only without the path.                                                                                                             
  2. Language Identification Algorithm:                                                                               
    • Utilizes a case statement to map file extensions to their corresponding programming languages.                  
  3. Error Handling Algorithm:                                                                                        
    • Implements basic validation to ensure a filename is provided and that the file exists,
    with appropriate user feedback.                                                                                                         
  4. Communication with API:                                                                                          
    • Constructs and sends a request to the OpenAI API to obtain explanations based on the
    file’s content.            
                                                                                                                      
                                                                                                                      
  ## Design Patterns                                                                                                  
                                                                                                                      
  1. Command Pattern:                                                                                                 
    • The script can be considered an example of the Command pattern where the action of executing
    the script can be seen as invoking a command that performs a specific business logic.                                               
  2. Strategy Pattern:                                                                                                
    • The selection of a Markdown highlighter, either  glow  or  tr , can be viewed as an application
    of the Strategy 
    pattern enabling the script to choose between different implementations based on availability.                    
  3. Facade Pattern:                                                                                                  
    • The script serves as a facade for the complexity of interacting with the OpenAI API,
    abstracting away details and providing a simple interface for code exploration.                                                            
  4. Template Method Pattern:                                                                                         
    • The overall flow of the script can be classified as a Template Method where the higher-level
    steps (file reading, language detection, API interaction) are fixed, while specific details
   (language-specific details) can vary based on input.                                                                                                         
                                                                                                                      
                                                                                                                      
  ## Summary                                                                                                          
                                                                                                                      
  The provided UNIX-shell script serves as a simple but effective utility for code exploration.
  By analyzing the file type and querying a language model, it helps users understand the purpose,
  algorithms, and design patterns present in the code. Through effective error handling, a modular
  approach to language detection, and a clean API interaction, the script exemplifies good design
  practices in shell scripting.  
```

## License

This work is licensed under Apache 2.0 license.
