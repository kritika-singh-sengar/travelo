## **API Endpoints:**

> ### 1. Eureka Server:

        - http://localhost:8761

> ### 2. Gateway:

        - http://localhost:9999

> ### 3. Login:

1. For SignUp:

   - URL [POST]- http://localhost:9999/user/signup
   - Request Body: User
   - Example:

   1. **Request:**
      {
      "name":"Kitika Singh",
      "email":"kritikasingh6421@gmail.com",
      "password":"12345678"
      }
      **Response:**
      kritikasingh6421@gmail.com sign Up successful.

   2. **Request:** - with same email Id:
      {
      "name":"Ritika Singh",
      "email":"kritikasingh6421@gmail.com",
      "password":"12345678"
      }
      **Response:**
      Sign Up fail.

2. For Token Generation:

   - URL [POST]- http://localhost:8088/user/token
   - Resquest Body- AuthRequest-
     {
     "email":"kritikasingh6421@gmail.com",
     "password":"12345678"
     }
   - Example:

   1. **Request:**
      -url: hhttp://localhost:8088/user/token
      {
      "email":"kritikasingh6421@gmail.com",
      "password":"12345678"
      }
      **Response:**
      eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJrcml0aWthc2luZ2g2NDIxQGdtYWlsLmNvbSIsImlhdCI6MTY3OTk3ODE4NSwiZXhwIjoxNjc5OTc5OTg1fQ.wCtsMTj-x28gcP5ZsTP2sIv2EEudqE8FwZSI-fpJCLM

   2. **Request:**- With wrong password:
      -url: http://localhost:9999/user/login/kritikasingh6421@gmail.com/123456
      -{
      "email":"kritikasingh6421@gmail.com",
      "password":"123456"
      }
      **Response:**
      {
      "timestamp": "2023-03-28T04:02:26.576+00:00",
      "status": 403,
      "error": "Forbidden",
      "path": "/user/token"
      }

3. For Token Validation:
   - URL [GET]- http://localhost:9999/user/validate?token={tokenValue}
   - Example:
   1. **Request:**
      -url: http://localhost:9999/user/validate?token=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJrcml0aWthc2luZ2g2NDIxQGdtYWlsLmNvbSIsImlhdCI6MTY3OTk3ODE4NSwiZXhwIjoxNjc5OTc5OTg1fQ.wCtsMTj-x28gcP5ZsTP2sIv2EEudqE8FwZSI-fpJCLM
      **Response:**
      Valid Token
   2. **Request:** {With invalid token}
      -url: http://localhost:9999/user/validate?token=fkse54ciOiJIUzI1NiJ9.eyJzdWIiOiJrcml0aWthc2luZ2g2NDIxQGdtYWlsLmNvbSIsImlhdCI6MTY3OTk3ODE4NSwiZXhwIjoxNjc5OTc5OTg1fQ.wCtsMTj-x28gcP5ZsTP2sIv2EEue45tFwZSI-fpJCLM
      **Response:**
      Invalid Token