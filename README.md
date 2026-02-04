Little Drop - Task Management & Authentication A Flutter application developed as a technical assessment, focusing on advanced authentication flows. The project implements a custom UI design and integrates with external APIs for both credential-based login and OTP (One-Time Password) verification.

🚀 Features Dual Login Methods:

Password Login: Supports both Email and Phone Number authentication through a single identifier field.

OTP Login: Implements a phone-based verification system including sending, verifying, and resending OTP codes.

Modern UI: Clean, user-friendly interface based on the "Little Drop" design.

Secure API Integration: Uses Retrofit and Dio for robust network communication with the Tamkeen Stores backend.

🛠️ Tech Stack Framework: Flutter

Network: Dio & Retrofit

State Management: Cubit

UI Patterns: Custom clip paths and responsive layouts.

📡 API Implementation Details The project utilizes the following endpoints:

POST /user-login-new: To trigger an OTP to the user's phone.

POST /check-otp-new: To verify the received code.

POST /login-email-new: For traditional credential entry (supports Email or Phone).

🚧 Areas for Enhancement While the core functionality is complete, the following improvements are planned:

Localization (L10n): Adding support for multiple languages (specifically Arabic and English) to cater to a wider user base.
