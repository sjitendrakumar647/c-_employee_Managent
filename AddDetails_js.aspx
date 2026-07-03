<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Student Registration</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg,#74ebd5,#ACB6E5);
            padding: 40px;
        }

        .container {
            width: 500px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #444;
        }

        .textbox,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .textbox:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .radio {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: .3s;
        }

        .btn:hover {
            background: #388E3C;
        }

        .table-container {
            width: 90%;
            margin: 30px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 5px 15px rgba(0,0,0,.15);
        }

        table th {
            background: #4CAF50;
            color: white;
            padding: 12px;
        }

        table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        table tr:hover {
            background: #f5f5f5;
        }
    </style>

</head>

<body>

    <form>

        <div class="container">

            <h2>Student Registration</h2>

            <div class="form-group">
                <label for="txtFirstName">First Name</label>
                <input
                    type="text"
                    id="txtFirstName"
                    name="txtFirstName"
                    class="textbox"
                    required />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <input
                    type="email"
                    id="txtEmail"
                    name="txtEmail"
                    class="textbox"
                    required />
            </div>

            <div class="form-group">
                <label>Gender</label>

                <div class="radio">
                    <label>
                        <input type="radio" name="gender" value="M" required />
                        Male
                    </label>

                    <label>
                        <input type="radio" name="gender" value="F" />
                        Female
                    </label>
                </div>

            </div>

            <div class="form-group">
                <label for="ddlCourse">Course</label>

                <select
                    id="ddlCourse"
                    name="ddlCourse"
                    class="textbox"
                    required>

                    <option value="">-- Select Course --</option>
                    <option value="1">B.Sc</option>
                    <option value="2">B.Tech</option>

                </select>
            </div>

            <button id="submit" type="submit" class="btn">
                Submit
            </button>

        </div>

        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Course</th>
                    </tr>
                </thead>

                <tbody id="tblStudents">
                    <!-- Student rows will be added here -->
                </tbody>

            </table>

        </div>

    </form>

</body>

    <script>
        document.getElementById("submit").addEventListener("click", function (e) {

            // Prevent form submission
            e.preventDefault();

            // Get values
            var firstName = document.getElementById("txtFirstName").value.trim();
            var email = document.getElementById("txtEmail").value.trim();
            var course = document.getElementById("ddlCourse").value;

            var gender = document.querySelector('input[name="gender"]:checked');

            // First Name Validation
            if (firstName === "") {
                alert("Please enter First Name.");
                document.getElementById("txtFirstName").focus();
                return;
            }

            // Only letters and spaces
            var nameRegex = /^[A-Za-z ]+$/;
            if (!nameRegex.test(firstName)) {
                alert("First Name should contain only letters.");
                document.getElementById("txtFirstName").focus();
                return;
            }

            // Email Validation
            if (email === "") {
                alert("Please enter Email.");
                document.getElementById("txtEmail").focus();
                return;
            }

            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailRegex.test(email)) {
                alert("Please enter a valid Email Address.");
                document.getElementById("txtEmail").focus();
                return;
            }

            // Gender Validation
            if (gender === null) {
                alert("Please select Gender.");
                return;
            }

            // Course Validation
            if (course === "") {
                alert("Please select a Course.");
                document.getElementById("ddlCourse").focus();
                return;
            }

            // Successa
            alert("Validation Successful!");

        });
    </script>
</html>