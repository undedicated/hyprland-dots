# What Is Bash
Bash is a scripting language native to Linux/Unix environments that can be used for task automation. It stands for **Born Again SHell** and it can be used by writing a new file and adding the **.sh** file extension at the end of it.

Its syntax is relatively the same as commands in your terminal, so translation is extremely easy.

> [!TIP]
> Remember, include **`#!/bin/bash`** at the beginning of every script, as it tells your computer to use the native Bash interpreter when running the script.

## Example 1
Here's an example of printing something to the console using Bash, with the file name "**hello.sh**":
```bash
#!/bin/bash
# Responds with: "Hello, world"
echo Hello, world
```

You're able to use comments in Bash similar to Python, by using the **#** (hashtag/pound) symbol and putting your message afterwards.

After creating your new script, make it executable (if required) by going to a terminal window, navigating to the directory of your script and running:
```bash
chmod +x hello.sh
./hello.sh
```
