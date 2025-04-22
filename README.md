# 🧠 Compiler Design Project: Lexical Analyzer using Lex

This project is part of the **Compiler Design** coursework and demonstrates how to write a **Lexical Analyzer** using the **Lex tool**. It scans the input source code and breaks it into a sequence of **tokens** like identifiers, keywords, numbers, and operators.

## 📘 Table of Contents

- [📌 About Lex](#-about-lex)
- [🛠️ Tools Used](#️-tools-used)
- [🚀 Getting Started](#-getting-started)
- [📄 Lex Code Explanation](#-lex-code-explanation)
- [🧪 Sample Input/Output](#-sample-inputoutput)
- [📂 Project Structure](#-project-structure)
- [📝 Notes](#-notes)
- [🧠 Credits](#-credits)

---

## 📌 About Lex

**Lex** is a lexical analyzer generator that is used to produce programs that perform lexical analysis. It reads the source code, matches patterns, and generates tokens for further syntax analysis.

Lex is commonly used with **Yacc** or **Bison**, but this project only uses Lex.

---

## 🛠️ Tools Used

- **Lex/Flex** – For generating the lexical analyzer
- **GCC** – To compile the generated `lex.yy.c` file
- **Linux Terminal** – To run the Lex tool
- **VS Code or Vim** – For editing `.l` files

---

## 🚀 Getting Started

### ✅ Prerequisites

Ensure you have the following installed:

```bash
sudo apt update
sudo apt install flex gcc
