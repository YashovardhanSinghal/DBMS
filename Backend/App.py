import mysql.connector
import re

usernumber = 100
cnaa = mysql.connector.connect(
    user="root", host="localhost", password="$Uvy1201&5!", database="inclusishop"
)
mycursor = cnaa.cursor()


def after_login_6(userid):

    # print("3.See all product categories")
    # print("4.See all products under a productcategory")
    # print("5.See products in cart")
    # print("6.Order products from your cart")
    # print("7.Exit")
    while True:
        print("1.View products")
        print("2.View Cart")
        print("3.Logout")
        inuu = int(input())
        if inuu == 1:
            mycursor.execute("select distinct(category) from product")
            index = 1
            print("*" * 20)
            for row in mycursor:
                print(index, " -> ", row[0])
                index += 1
            print("*" * 20)
            ch = int(input("enter choice number for category : "))
            if ch == 1:
                cat = "Mobility"
            elif ch == 2:
                cat = "Hearing"
            elif ch == 3:
                cat = "Vision"
            elif ch == 4:
                cat = "Speech"

            sql = "SELECT Name, Product_id FROM product WHERE product.Category = %s"
            val = (cat,)
            mycursor.execute(sql, val)

            print("These are the Availible products for this category:")
            for row in mycursor:
                print(row[1], " ", row[0])

            pro_id = int(input("Enter product id of the required product : "))
            query3 = "select  * from product where product_id= %s"
            val = (pro_id,)
            mycursor.execute(query3, val)
            print("Name Description Company ")
            for row in mycursor:
                print(row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            cart_ch = int(input("enter 1 to add to cart else 2"))
            if cart_ch == 1:
                qty = int(input("enter quantity"))
                cart_id = userid
                sql_q = "insert into cart values(%s,%s,%s)"
                val2 = (
                    cart_id,
                    pro_id,
                    qty,
                )
                mycursor.execute(sql_q, val2)

                print("Added to cart")
            else:
                print("not added")
                continue
        elif inuu == 2:
            print("Products in cart are ")
            sql = "SELECT Product_id,Name FROM product,cart WHERE product.productid = cart.product_id and cart_id="
            val = (cat,)
            mycursor.execute(sql, val)
        elif inuu == 3:
            print("Logged out")
            break


def after_login_4(userid):

    # print("3.See all product categories")
    # print("4.See all products under a productcategory")
    # print("5.See products in cart")
    # print("6.Order products from your cart")
    # print("7.Exit")
    while True:
        print("1.View products")
        print("2.View Cart")
        print("3.Logout")
        inuu = int(input())
        if inuu == 1:
            mycursor.execute("select distinct(category) from product")
            index = 1
            print("*" * 20)
            for row in mycursor:
                print(index, " -> ", row[0])
                index += 1
            print("*" * 20)
            ch = int(input("enter choice number for category : "))
            if ch == 1:
                cat = "Mobility"
            elif ch == 2:
                cat = "Hearing"
            elif ch == 3:
                cat = "Vision"
            elif ch == 4:
                cat = "Speech"

            sql = "SELECT Name, Product_id FROM product WHERE product.Category = %s"
            val = (cat,)
            mycursor.execute(sql, val)

            print("These are the Availible products for this category:")
            for row in mycursor:
                print(row[1], " ", row[0])

            pro_id = int(input("Enter product id of the required product : "))
            query3 = "select  * from product where product_id= %s"
            val = (pro_id,)
            mycursor.execute(query3, val)
            print("Name Description Company ")
            for row in mycursor:
                print(row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            cart_ch = int(input("enter 1 to add to cart else 2"))
            if cart_ch == 1:
                qty = int(input("enter quantity"))
                cart_id = userid
                sql_q = "insert into cart values(%s,%s,%s)"
                val2 = (
                    cart_id,
                    pro_id,
                    qty,
                )
                mycursor.execute(sql_q, val2)

                print("Added to cart")
            else:
                print("not added")
                continue
        elif inuu == 2:
            print("Products in cart are ")
            sql = "SELECT Product_id,Name FROM product,cart WHERE product.productid = cart.product_id and cart_id="
            val = (cat,)
            mycursor.execute(sql, val)
        elif inuu == 3:
            print("Logged out")
            break


def after_login_1(userid):

    # print("3.See all product categories")
    # print("4.See all products under a productcategory")
    # print("5.See products in cart")
    # print("6.Order products from your cart")
    # print("7.Exit")
    while True:
        print("1.View products")
        print("2.View Cart")
        print("3.Logout")
        inuu = int(input())
        if inuu == 1:
            mycursor.execute("select distinct(category) from product")
            index = 1
            print("*" * 20)
            for row in mycursor:
                print(index, " -> ", row[0])
                index += 1
            print("*" * 20)
            ch = int(input("enter choice number for category : "))
            if ch == 1:
                cat = "Mobility"
            elif ch == 2:
                cat = "Hearing"
            elif ch == 3:
                cat = "Vision"
            elif ch == 4:
                cat = "Speech"

            sql = "SELECT Name, Product_id FROM product WHERE product.Category = %s"
            val = (cat,)
            mycursor.execute(sql, val)

            print("These are the Availible products for this category:")
            for row in mycursor:
                print(row[1], " ", row[0])

            pro_id = int(input("Enter product id of the required product : "))
            query3 = "select  * from product where product_id= %s"
            val = (pro_id,)
            mycursor.execute(query3, val)
            print("Name Description Company ")
            for row in mycursor:
                print(row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            cart_ch = int(input("enter 1 to add to cart else 2"))
            if cart_ch == 1:
                qty = int(input("enter quantity"))
                cart_id = userid
                sql_q = "insert into cart values(%s,%s,%s)"
                val2 = (
                    cart_id,
                    pro_id,
                    qty,
                )
                mycursor.execute(sql_q, val2)

                print("Added to cart")
            else:
                print("not added")
                continue
        elif inuu == 2:
            print("Products in cart are ")
            sql = "SELECT Product_id,Name FROM product,cart WHERE product.productid = cart.product_id and cart_id="
            val = (cat,)
            mycursor.execute(sql, val)
        elif inuu == 3:
            print("Logged out")
            break


def after_login(userid):

    # print("3.See all product categories")
    # print("4.See all products under a productcategory")
    # print("5.See products in cart")
    # print("6.Order products from your cart")
    # print("7.Exit")
    while True:
        print("1.View products")
        print("2.View Cart")
        print("3.Logout")
        inuu = int(input())
        if inuu == 1:
            mycursor.execute("select distinct(category) from product")
            index = 1
            print("*" * 20)
            for row in mycursor:
                print(index, " -> ", row[0])
                index += 1
            print("*" * 20)
            ch = int(input("enter choice number for category : "))
            if ch == 1:
                cat = "Mobility"
            elif ch == 2:
                cat = "Hearing"
            elif ch == 3:
                cat = "Vision"
            elif ch == 4:
                cat = "Speech"

            sql = "SELECT Name, Product_id FROM product WHERE product.Category = %s"
            val = (cat,)
            mycursor.execute(sql, val)

            print("These are the Availible products for this category:")
            for row in mycursor:
                print(row[1], " ", row[0])

            pro_id = int(input("Enter product id of the required product : "))
            query3 = "select  * from product where product_id= %s"
            val = (pro_id,)
            mycursor.execute(query3, val)
            print("Name Description Company ")
            for row in mycursor:
                print(row[1], row[2], row[3], row[4], row[5], row[6], row[7])
            cart_ch = int(input("enter 1 to add to cart else 2"))
            if cart_ch == 1:
                qty = int(input("enter quantity"))
                cart_id = userid
                sql_q = "insert into cart values(%s,%s,%s)"
                val2 = (
                    cart_id,
                    pro_id,
                    qty,
                )
                mycursor.execute(sql_q, val2)

                print("Added to cart")
            else:
                print("not added")
                continue
        elif inuu == 2:
            print("Products in cart are ")
            sql = "SELECT Product_id,Name FROM product,cart WHERE product.productid = cart.product_id and cart_id="
            val = (cat,)
            mycursor.execute(sql, val)
        elif inuu == 3:
            print("Logged out")
            break


def validate_email(email):
    pattern = re.compile(r"[^@]+@[^@]+\.[^@]+")
    return pattern.match(email)


def login():
    print()
    print()
    print("#" * 50)
    print(" ADMIN  Login . How are you!!!!")
    print("#" * 50)
    print()
    print()
    print()
    print("Please Enter Valid Username and Password")
    admin_id = str(input("enter username:"))
    password = str(input("enter password:"))
    query = "Select * From Admin where AdminID='{}' and Password='{}'".format(
        admin_id, password
    )
    mycursor.execute(query)
    rec = mycursor.fetchall()
    cnaa.commit()

    if rec:
        print("\tACCESS GRANTED")
        return True
    else:
        print("-" * 50)
        print("\tWrong credentials")
        print("-" * 50)
        return False


# baadne
def signup():
    while True:

        print("#" * 50)
        userID = usernumber + 1
        usernumber + 1
        username = str(input("enter username:"))
        password = str(input("enter password:"))
        print("#" * 50)

        Firstname = input("Enter FirstName: ")
        Lastname = input("Enter LastName: ")
        age = input("Enter Age: ")
        gender = input("Enter Gender: ")
        pno = input("Enter Phone Number: ")
        email = input("Enter Email Address: ")
        state = input("Enter State: ")
        city = input("Enter City: ")
        street = input("Enter Street: ")
        apartmentno = input("Enter Apartment No: ")
        pincode = input("Enter Pincode: ")

        # Confirmation
        if len(pno) != 10:
            print("Error: Please Enter 10 digits")
            continue
        if not validate_email(email):
            print("Error: Email Address not valid")
            continue

        try:
            sql1 = "INSERT INTO Users (UserID, firstname,lastname, Age,Gender, PhoneNumber1, EmailAddress1,  State, City, Street, ApartmentNo, Pincode) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            val1 = (
                userID,
                Firstname,
                Lastname,
                age,
                gender,
                pno,
                email,
                state,
                city,
                street,
                apartmentno,
                pincode,
            )
            sql2 = "INSERT INTO logincredentials (UserID, username,password) VALUES (  %s,  %s, %s)"
            val2 = (
                userID,
                username,
                password,
            )
            mycursor.execute(sql1, val1)
            mycursor.execute(sql2, val2)
            cnaa.commit()  # Commit the changes to the database
            print("User signed up successfully!")
            break
        except mysql.connector.Error as err:
            if err.errno == 1062:
                print("Error: Duplicate entry. UserID or Email Address already exists.")
            elif err.errno == 1406:
                print("Error: Input value too long. Please provide shorter values.")
            elif err.errno == 1264:
                print("Error: Age value is too big. Please provide a smaller value.")
            elif err.errno == 3819:
                print(
                    "Error: Invalid input format for Email Address/ Age incorrect/phone number/ pincode. Please provide a valid email address."
                )
            else:
                print(
                    "Error, try with valid entries. try entering all essential details:"
                )
        finally:
            mycursor.close()  # Close the cursor
            cnaa.close()  # Close the connection


def bbsnssbnsb():
    while True:
        userID = input("Enter UserID: ")
        name = input("Enter Name: ")
        age = input("Enter Age: ")
        phonenumber = input("Enter Phone Number: ")
        emailaddress1 = input("Enter Email Address1: ")
        emailaddress2 = input("Enter Email Address2 (optional): ")
        state = input("Enter State: ")
        city = input("Enter City: ")
        street = input("Enter Street: ")
        apartmentno = input("Enter Apartment No: ")
        pincode = input("Enter Pincode: ")
        landmark = input("Enter Landmark: ")
        cnaa.commit

        # Validations
        if len(phonenumber) != 10:
            print("Error: Only 10 digits allowed for Phone Number")
            continue
        if not validate_email(emailaddress1):
            print("Error: Email Address1 isn't valid")
            continue
        if emailaddress2 and not validate_email(emailaddress2):
            print("Error: Email Address2 isn't valid")
            continue

        # Insert into database
        try:

            sql = "INSERT INTO Users (UserID, name, Age, PhoneNumber1, EmailAddress1, EmailAddress2, State, City, Street, ApartmentNo, Pincode, Landmark) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            val = (
                userID,
                name,
                age,
                phonenumber,
                emailaddress1,
                emailaddress2,
                state,
                city,
                street,
                apartmentno,
                pincode,
                landmark,
            )
            mycursor.execute(sql, val)

            print("User signed up successfully!")
            break
        except mysql.connector.Error as err:
            if err.errno == 1062:
                print("Error: Duplicate entry. UserID or Email Address already exists.")
            elif err.errno == 1406:
                print("Error: Input value too long. Please provide shorter values.")
            elif err.errno == 1264:
                print("Error: Age value is too big. Please provide a smaller value.")
            elif err.errno == 3819:
                print(
                    "Error: Invalid input format for Email Address. Please provide a valid email address."
                )
            else:
                print("Error, try with valid entries:", err.msg)


def add_product():
    print("Add a Product")
    name = input("Enter Product Name: ")
    description = input("Enter Product Description: ")
    company_name = input("Enter Company Name: ")
    category = input("Enter Product Category: ")
    status = input("Enter Product Status (True/False): ")
    supplier_id = input("Enter Supplier ID: ")
    quantity = input("Enter Quantity: ")

    # Insert into database
    try:
        sql = "INSERT INTO Product (Name, Description, Company_name, Category, SupplierID, Quantity) VALUES (%s, %s, %s,  %s, %s, %s)"
        val = (name, description, company_name, category, supplier_id, quantity)
        mycursor.execute(sql, val)
        cnaa.commit()
        print("Product added successfully!")
    except mysql.connector.Error as err:
        print("Error:", err)


def display_delivery_workers():
    try:
        # Establish connection to the database
        # cursor = cnaa.cursor()

        # Execute SQL query to retrieve delivery workers data
        query = "SELECT ID, FirstName,LastName, Age, Gender,City,Phone_number FROM DeliveryAgent"
        mycursor.execute(query)

        # Print column headers
        print()
        print()
        print(
            "{:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:15} ".format(
                "ID", "FirstName", "LastName", "Age", "Gender", "City", "PhoneNumber"
            )
        )
        print("--" * 55)

        for ID, FirstName, LastName, Age, Gender, City, Phone_number in mycursor:
            print(
                "{:<15} {:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format(
                    ID, FirstName, LastName, Age, Gender, City, Phone_number
                )
            )

        print("--" * 55)
        # Close cursor and connection
        mycursor.close()
        cnaa.close()

    except mysql.connector.Error as err:
        print("Error:", err)


def add_ngo():
    print("Add an NGO")
    name = input("Enter NGO Name: ")
    # company_id = input("Enter Company ID: ")
    description = input("Enter NGO Description: ")
    email = input("Enter Email Address: ")
    address = input("Enter Address: ")
    contact_number = input("Enter Contact Number: ")

    try:
        sql = "INSERT INTO NGOs (Name, Description, Email, Address, ContactNumber) VALUES (%s, %s, %s, %s, %s)"
        val = (name, description, email, address, contact_number)
        mycursor.execute(sql, val)
        cnaa.commit()
        print("NGO added successfully!")
    except mysql.connector.Error as err:
        print("Error:", err)


def get_active_users_count():
    try:
        # Execute SQL query to count the number of active users
        query = "SELECT COUNT(*) AS ActiveUsersCount FROM Users WHERE account_status = 'Active';"
        mycursor.execute(query)
        result = mycursor.fetchone()
        active_users_count = result[0]
        print(f"The number of active users are : {active_users_count}")
    except mysql.connector.Error as err:
        print(f"An error occurred: {err}")


# Function to display user information with total purchases
def display_user():
    try:
        # Establish connection to the database

        # Execute SQL query to fetch user information
        query = """
            SELECT u.UserID, u.name, COUNT(o.OrderID) AS TotalPurchases
            FROM Users u
            LEFT JOIN OrderTable o ON u.UserID = o.UserID
            GROUP BY u.UserID, u.name
            HAVING COUNT(o.OrderID) >= 1
        """
        mycursor.execute(query)

        # Print column headers
        print("{:<10} {:<30} {:<15}".format("User ID", "User Name", "Total Purchases"))
        print("=" * 60)

        # Iterate over the rows and print user information
        for UserID, name, TotalPurchases in mycursor:
            print("{:<10} {:<30} {:<15}".format(UserID, name, TotalPurchases))

        # Close cursor and connection

    except mysql.connector.Error as err:
        print("Error:", err)


def inventory_analysis():
    try:

        query = """
            SELECT p.Product_ID, p.Name, p.Description as Description, s.Name AS Supplier, s.City AS SupplierCity, s.State AS SupplierState
            FROM Product p
            JOIN Supplier s ON p.SupplierID = s.SupplierID
        """
        mycursor.execute(query)

        # Print column headers
        print(
            "{:<10} {:<30}  {:<5} {:<20} {:<15} {:<15}".format(
                "Product ID",
                "Product Name",
                "Description",
                "Supplier",
                "Supplier City",
                "Supplier State",
            )
        )
        print("--" * 55)

        # Iterate over the rows and print product information
        for (
            Product_ID,
            Name,
            Description,
            Supplier,
            SupplierCity,
            SupplierState,
        ) in mycursor:
            print(
                "{:<10} {:<30} {:<5} {:<20} {:<15} {:<15}".format(
                    Product_ID,
                    Name,
                    Description,
                    Supplier,
                    SupplierCity,
                    SupplierState,
                )
            )
        print("--" * 55)

    except mysql.connector.Error as err:
        print("Error:", err)


def view_product_sales():

    try:
        # Establish connection to the database

        # Execute SQL query to fetch product sale statistics from the view
        query = "SELECT Product_Name, Supplier_Name, Total_Units_Sold, Total_Sales_Amount FROM ProductSalesSummary"
        mycursor.execute(query)

        # Print column headers
        print("=" * 110)
        print(
            "{:<30} {:<30} {:<20} {:<20}".format(
                "Product Name",
                "Supplier Name",
                "Total Units Sold",
                "Total Sales Amount",
            )
        )
        print("=" * 110)

        # Iterate over the rows and print product sale statistics
        for (
            Product_Name,
            Supplier_Name,
            Total_Units_Sold,
            Total_Sales_Amount,
        ) in mycursor:
            print(
                "{:<10} {:<30} {:<30} {:<20} {:<20}".format(
                    Product_Name, Supplier_Name, Total_Units_Sold, Total_Sales_Amount
                )
            )

    except mysql.connector.Error as err:
        print("Error:", err)


while True:

    # print("3.See all product categories")
    # print("4.See all products under a productcategory")
    # print("5.See products in cart")
    # print("6.Order products from your cart")
    # print("7.Exit")

    login_input = int(input("Enter 1 for Admin Login / Enter 2 for User Login "))
    admin_login_count = 0
    if login_input == 1:
        log_attempt = login()
        while True:
            print(" Admin Menu : Enter digit accordingly")
            if log_attempt:
                print("*" * 50)
                print("1. Add Product")
                print("2. Add NGO")
                print("3. Show Delivery workers general information ")
                print("4. See the number of Active users ")
                print("5. Show Analysis of the current inventory")
                print("6. Display Users with alteast one purchase")
                print("7. View Product Sale Stats")
                print("8. Logout")
                print("*" * 50)
                chk = int(input())
                if chk == 1:
                    add_product()
                if chk == 2:
                    add_ngo()
                if chk == 3:
                    display_delivery_workers()
                if chk == 4:
                    get_active_users_count()
                if chk == 5:
                    inventory_analysis()
                if chk == 6:
                    display_user()
                if chk == 7:
                    view_product_sales()
                if chk == 8:
                    print("Exiting")
                    break
        continue
        # while login() != True:
        #     admin_login_count += 1
        #     if admin_login_count == 3:
        #         break
        #     login()

    elif login_input == 2:
        print("1.Sign up")
        print("2.Log In")
        print("3.Exit")
        inuu = int(input())
        if inuu == 1:
            signup()
        elif inuu == 2:

            print("^" * 50)
            print("Login as USER")
            print("^" * 50)
            logincount = 0
            while True:

                if logincount == 4:
                    break
                print("^" * 50)
                print("Please Enter your username")
                username = str(input("enter username:"))
                query2 = "Select * From logincredentials where username='{}' ".format(
                    username
                )
                mycursor.execute(query2)

                rec_recheck = mycursor.fetchone()

                if rec_recheck:
                    userid = rec_recheck[0]
                    # print(userid)
                    status_query = (
                        "Select account_status From users where userid='{}' ".format(
                            userid
                        )
                    )
                    mycursor.execute(status_query)

                    bl = mycursor.fetchone()
                    b = bl[0]
                    if b == "Blocked":
                        print("^" * 50)
                        print("Blocked userid")
                        print(" Can't Enter ")
                        break
                    password = str(input("enter password:"))
                    pass_query = (
                        "Select * From logincredentials where Password='{}' ".format(
                            password
                        )
                    )
                    mycursor.execute(pass_query)
                    pass_recheck = mycursor.fetchall()

                    if pass_recheck:
                        print("^" * 50)
                        print("ACCESS GRANTED")
                        print("1.Search Product")
                        print("2.")
                        after_login(userid)
                        #! to include rest of the code
                        break
                    else:
                        logincount += 1
                        print("Password Incorrect")
                        print(" Restarting ")
                        insert_attempt = (
                            "INSERT INTO UserLoginAttempts (UserID) VALUES (  %s)"
                        )
                        val2 = (userid,)
                        mycursor.execute(insert_attempt, val2)
                        cnaa.commit()
                else:
                    print("wrong username")
        elif inuu == 3:
            print("Logging out")
            break
