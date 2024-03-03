document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent the form from submitting

    // Get username and password from form
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    // Check if username and password are correct
    if (username === "karim" && password === "1234") {
        // Redirect the user to another page
        window.location.href = "another_page.html"; // Replace "another_page.html" with your desired page
    } else {
        alert("Invalid username or password. Please try again.");
    }
});
