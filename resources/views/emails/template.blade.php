<!DOCTYPE html>
<html>
<head>
  <title>DTeam Publisher Account Creation</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }

    .container {
      max-width: 600px;
      margin: 20px auto;
      padding: 30px;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    h1 {
      font-size: 24px;
      margin-bottom: 15px;
      text-align: center;
    }

    p {
      font-size: 16px;
      line-height: 1.5;
      margin-bottom: 10px;
    }

    .important {
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>{{ $details['title'] }}</h1>
    <p>Your DTeam Publisher account has been created. Here are your login credentials:</p>
    <p>Email: <span class="important">{{ $details['email'] }}</span></p>
    <p>Password: {{ $details['password'] }}</p>
    <p>Please change your password later.</p>
  </div>
</body>
</html>
