# ECCOMMERCE-APIs

## **Installation**

To run the project, you need Python and `pip` installed on your machine. Here are the steps to run the project:

1. Clone the repository to your local machine.
2. Create a virtual environment:
    ```bash
    python -m venv venv
    ```
3. Activate the virtual environment:
        ```bash
        .\venv\Scripts\activate
        ```
4. Install the required packages using `pip`:
    ```bash
    pip install -r requirements.txt
    ```
5. Install `pre-commit` hooks:
    ```bash
    pre-commit install
    ```
6. Run migrations using:
        ```bash
        -python manage.py makemigrations -  preps the database for migrations
        -python manage.py migrate - to migrate the database
        ```
7. Start the development server using:
        ```bash
        -python manage.py runserver
        ```

### **Additional Notes**

- The `pre-commit` hooks will automatically run before you commit any changes to ensure code quality and consistency.
- If the `pre-commit` tests fail, they will automatically attempt to fix the issues. After `pre-commit` has made updates, you should run:
    ```bash
    git add <modified-files>
    git commit -m "<original-commit-message>"
    ```
- If you need to manually run the `pre-commit` hooks, you can use:
    ```bash
    pre-commit run --all-files
    ```
