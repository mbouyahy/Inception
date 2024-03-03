import mysql.connector

# Connect to the MariaDB server
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password=""
)

# Create a cursor object to execute SQL queries
cursor = connection.cursor()

# Set up a root password
cursor.execute("ALTER USER 'root'@'localhost' IDENTIFIED BY 'new_password';")

# Remove anonymous user accounts
cursor.execute("DROP USER ''@'localhost';")
cursor.execute("DROP USER ''@'%';")

# Disallow remote root login
cursor.execute("DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');")

# Remove test databases and privileges
cursor.execute("DROP DATABASE IF EXISTS test;")
cursor.execute("DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';")
cursor.execute("FLUSH PRIVILEGES;")

# Commit the changes and close the connection
connection.commit()
connection.close()

print("MariaDB setup complete.")
