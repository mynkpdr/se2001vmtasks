Please use your knowledge of the commands like `mkdir`, `touch`, `ln` etc. to achieve the following directory structure in the current working directory by running the commands (not a script).

1. **Create Directories**:
    
    - Create a base directory called `project`.
    - Within `project`, create the following subdirectories using brace expansion:
        - `src/{module1,module2}/{include,lib}`
        - `docs/{api,manual}`
    - Create a directory `bin` within `project`.


2. **Create Files**:
    
    - Inside `src/module1/include`, create an empty file named `module1.h`.
    - Inside `src/module1/lib`, create an empty file named `module1.so`.
    - Inside `src/module2/include`, create an empty file named `module2.h`.
    - Inside `src/module2/lib`, create an empty file named `module2.so`.


3. **Create Hard Links**:
    
    - Create a hard link to `module1.h` in the `bin` directory and name it `module1_hardlink.h`.
    - Create a hard link to `module2.so` in the `bin` directory and name it `module2_hardlink.so`.


4. **Create Soft Links**:
    
    - Create a soft link to the `docs` directory in the `project` directory and name it `documentation`.
    - Create a soft link to `module1.so` inside `module2/lib` directory and name it `module1_symlink.so`.


5. **Modify Permissions**:
    
    - Set the permission of `project` directory to `755`.
    - Set the permission of all directories under `project/src` to `700`.
    - Set the permission of all `.h` files to `644`.
    - Set the permission of all `.so` files to `755`.

