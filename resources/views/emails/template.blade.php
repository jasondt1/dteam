<!DOCTYPE html>
<html>
<head>
    <title>Publisher Account Creation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1b2838;
            color: #c7d5e0;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #222428;
            padding: 20px;
            padding-top: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .header {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #4a6782;
        }
        .content {
            padding: 20px;
            text-align: center;
        }
        .content h1 {
            color: #c7d5e0;
        }
        .important {
            font-weight: bold;
            color: #c7d5e0;
            text-decoration: none;
        }
        .footer {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #4a6782;
            color: #8f98a0;
        }
        .footer a {
            color: #c7d5e0;
            text-decoration: none;
        }
        p {
            color: #c7d5e0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="https://media.discordapp.net/attachments/1266980441123196930/1267081494199795834/download_3.png?ex=66a77d19&is=66a62b99&hm=99698b7eefe58c947d248ff75c07602a47c2998ba8b0f51b5aa97bfecd23d4b5&=&format=webp&quality=lossless&width=2160&height=654" alt="Logo" width="250" height="75">
        </div>
        <div class="content">
            <h1>{{ $details['title'] }}</h1>
            <p>Your DTeam Publisher account has been created. Here are your login credentials:</p>
            <p>Email: <span class="important">{{ $details['email'] }}</span></p>
            <p>Password: {{ $details['password'] }}</p>
            <p>Please login and setup your account.</p>
        </div>
        <div class="footer">
            <p>If you didn't request this, please ignore this email.</p>
        </div>
    </div>
</body>
</html>
