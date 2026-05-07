# Assignment: 3-Tier Application on AWS EC2

## Module 4 - DevOps Assignment
---

## Objective

The objective of this assignment is to design and deploy a 3-tier application using AWS EC2 instances.

The application is divided into three layers:

1. Presentation Layer
2. Application Layer
3. Data Layer

---

# 1. VPC Setup

For this assignment, I created a custom VPC on AWS to deploy a 3-tier application architecture using EC2 instances. The main purpose of this VPC was to separate the application into three layers and keep the backend and database servers private.

The architecture has three main layers:

1. Presentation Layer - Public Web Server EC2
2. Application Layer - Private App Server EC2
3. Data Layer - Private DB Server EC2

## VPC Information

```text
VPC Name: devops-3tier-vpc
VPC CIDR Block: 10.0.0.0/16
```

This CIDR block gives enough private IP addresses for all the subnets and EC2 instances used in the project.

## Subnet Design

Inside the VPC, I created separate subnets for each layer of the application.

| Subnet | CIDR Block | Purpose |
|---|---|---|
| Public Web Subnet | `10.0.1.0/24` | Used for the public web server EC2 instance |
| Private DB Subnet | `10.0.2.0/24` | Used for the private database server EC2 instance |
| Private App Subnet | `10.0.3.0/24` | Used for the private backend app server EC2 instance |

The web server was placed in the public subnet because users need to access the website from the internet. The app server and database server were placed in private subnets because they should not be directly accessible from the public internet.

## Internet Gateway

I created an Internet Gateway and attached it to the VPC.

```text
Internet Gateway Name: devops-3tier-igw
```

The Internet Gateway was used by the public subnet so that the web server could receive traffic from the internet.

The public route table had this route:

```text
Destination: 0.0.0.0/0
Target: Internet Gateway
```

This allowed the public web server to access the internet and also allowed users to access the web application.

## Route Table Setup

I used separate route tables for public and private subnets.

### Public Route Table

- Associated with the public web subnet
- Has a default route to the Internet Gateway
- Allows the web server to be publicly accessible

### Private Route Tables

- Associated with the private app and private DB subnets
- Local VPC communication is allowed using the local route
- No direct public inbound access is allowed

## Temporary NAT Setup for Private Servers

The app server and database server were private instances. They did not have public IP addresses. Because of this, they could not directly download packages from the internet.

To solve this during setup, I used temporary NAT access from the public subnet. This allowed the private servers to download packages and updates without making them publicly accessible.

The private subnet internet flow during setup was:

```text
Private EC2 Instance
        ↓
Private Route Table
        ↓
Temporary NAT access in Public Subnet
        ↓
Internet Gateway
        ↓
Internet
```

This NAT access was only used for outbound package installation during setup. The backend and database servers still remained private from inbound internet traffic.

## Final VPC Design

The final VPC design was:

```text
Internet User
     ↓
Public Web Server EC2
     ↓
Private App Server EC2
     ↓
Private DB Server EC2
```

This setup improves security because only the web server is public. The app server and database server remain private inside the VPC.

---

# 2. Web Server EC2 Instance - Public

After completing the VPC setup, I created the public web server EC2 instance. This server works as the main entry point of the application.

The web server runs the Next.js frontend application. It also uses Nginx as a reverse proxy. Nginx forwards frontend requests to the Next.js application and backend-related requests to the private app server.

## Web Server Details

```text
Instance Name: web-server
Operating System: Ubuntu 24.04
Instance Type: t2.xlarge
Public IP: 3.8.126.81
Frontend Framework: Next.js 15.2.3
Web Server: Nginx
Process Manager: PM2
```

The web server is public because users need to access the website through the browser.

## Web Server Security Group

The web server security group allowed only the required traffic.

| Type | Port | Source |
|---|---|---|
| SSH | 22 | My IP |
| HTTP | 80 | 0.0.0.0/0 |
| HTTPS | 443 | 0.0.0.0/0 |

Port `3000` was not opened publicly because the Next.js application runs internally on localhost. Public users access the application through Nginx on port 80.

## Connecting to the Web Server

I connected to the web server using SSH:

```bash
chmod 400 devops-3tier-key.pem
ssh -i devops-3tier-key.pem ubuntu@3.8.126.81
```

After connecting, I updated the server packages:

```bash
sudo apt update
sudo apt upgrade -y
```

## Installing Required Packages

I installed the required packages for the frontend server:

```bash
sudo apt install -y curl git nginx
```

Then I installed Node.js 22:

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

I checked the installed versions:

```bash
node -v
npm -v
```

## Installing PM2

I installed PM2 to keep the Next.js application running in the background:

```bash
sudo npm install -g pm2
```

## Deploying the Next.js Frontend

I placed the frontend project inside `/var/www`.

```bash
sudo mkdir -p /var/www
cd /var/www
sudo git clone https://github.com/shefat-global/devops-b11-m4-3-tier-application-aws-ec2 frontend
sudo chown -R ubuntu:ubuntu /var/www/frontend
```

Then I moved into the frontend project folder:

```bash
cd /var/www/frontend/frontend
```

I installed dependencies:

```bash
npm install
```

Then I built the production version:

```bash
npm run build
```

After the build was complete, I started the frontend using PM2:

```bash
pm2 start npm --name frontend -- start
pm2 save
pm2 startup
```

I checked the status using:

```bash
pm2 status
```

## Nginx Reverse Proxy Setup

I configured Nginx so that the public IP loads the frontend application. I also configured Nginx to forward backend-related routes to the private app server.

The private app server IP was:

```text
10.0.3.142
```

The backend application was running on port:

```text
8000
```

I created the Nginx configuration file:

```bash
sudo nano /etc/nginx/sites-available/frontend
```

The Nginx configuration was:

```nginx
server {
    listen 80;
    server_name 3.8.126.81;

    client_max_body_size 50M;

    location /api/ {
        proxy_pass http://10.0.3.142:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /admin/ {
        proxy_pass http://10.0.3.142:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /static/ {
        proxy_pass http://10.0.3.142:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /media/ {
        proxy_pass http://10.0.3.142:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Then I enabled the configuration:

```bash
sudo ln -s /etc/nginx/sites-available/frontend /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
```

## Testing the Web Server

I tested the frontend locally:

```bash
curl http://127.0.0.1:3000
```

Then I tested Nginx:

```bash
curl http://localhost
```

Finally, I opened the public IP in the browser:

```text
http://3.8.126.81
```

The frontend application loaded successfully.

This confirmed that the public web server was working properly with Next.js, PM2, and Nginx.

---

# 3. App Server EC2 Instance - Private

Next, I created the private app server EC2 instance. This server runs the backend application. The backend is built with Python, Django, and Wagtail.

The app server is private, so it does not have direct public access. It can only be accessed through the public web server.

## App Server Details

```text
App Server Private IP: 10.0.3.142
Backend Framework: Wagtail 6.3 LTS / Django
Python Version: 3.10.6
Application Server: Gunicorn
Backend Port: 8000
Service Manager: systemd
```

## App Server Security Group

The app server security group was configured to allow traffic only from the web server.

| Type | Port | Source |
|---|---|---|
| SSH | 22 | SG-Web |
| Custom TCP | 8000 | SG-Web |

Port `8000` was allowed because Gunicorn runs the backend application on this port.

## Connecting to the Private App Server

Since the app server is private, I connected to it through the public web server.

First, I prepared SSH agent forwarding from my local machine:

```bash
chmod 400 devops-3tier-key.pem
eval "$(ssh-agent -s)"
ssh-add devops-3tier-key.pem
```

Then I connected to the public web server:

```bash
ssh -A ubuntu@3.8.126.81
```

From the web server, I connected to the private app server:

```bash
ssh ubuntu@10.0.3.142
```

This method is more secure because I did not need to upload the private `.pem` key to the web server.

## Installing Required Packages

After connecting to the app server, I updated the packages:

```bash
sudo apt update && sudo apt upgrade -y
```

Then I installed the required system packages:

```bash
sudo apt install -y \
git curl wget unzip make build-essential \
libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
libsqlite3-dev llvm libncursesw5-dev xz-utils tk-dev \
libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
python3-dev libpq-dev
```

## Installing Python 3.10.6

The backend project required Python 3.10.6, so I installed it using pyenv.

```bash
curl https://pyenv.run | bash
```

Then I added pyenv to `.bashrc`:

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
```

Then I installed Python 3.10.6:

```bash
pyenv install 3.10.6
```

Inside the backend project directory, I selected the Python version:

```bash
cd ~/backend
pyenv local 3.10.6
python --version
```

Expected output:

```text
Python 3.10.6
```

## Creating Virtual Environment

I created a Python virtual environment:

```bash
cd ~/backend
python -m venv venv
source venv/bin/activate
```

Then I checked the Python path:

```bash
which python
```

The output showed that Python was running from the virtual environment.

## Installing Backend Dependencies

I upgraded pip:

```bash
pip install --upgrade pip setuptools wheel
```

Then I installed the project dependencies:

```bash
pip install -r requirements.txt
pip install gunicorn
```

For MySQL dependency support, I installed:

```bash
sudo apt install -y pkg-config default-libmysqlclient-dev build-essential python3-dev
```

## Django and Wagtail Configuration

I updated the Django settings so the backend could work with the public web server IP and the private app server IP.

Example configuration:

```text
ALLOWED_HOSTS=3.8.126.81,10.0.3.142
CSRF_TRUSTED_ORIGINS=http://3.8.126.81
```

I also fixed the CORS configuration. The wrong configuration was:

```python
CORS_ALLOWED_ORIGINS = ["*"]
```

The correct configuration used full origins:

```python
CORS_ALLOWED_ORIGINS = [
    "http://3.8.126.81",
]
```

## Connecting the App Server to the Database

The database server private IP was:

```text
10.0.2.36
```

I installed the MySQL client on the app server:

```bash
sudo apt install -y mysql-client
```

Then I tested the database connection:

```bash
mysql -h 10.0.2.36 -u portfolio_user -p -P 3306
```

The Django database settings were updated like this:

```text
DB_NAME=portfolio_cms
DB_USER=portfolio_user
DB_PASSWORD=YOUR_DB_PASSWORD
DB_HOST=10.0.2.36
DB_PORT=3306
```

After the database connection was working, I ran migrations:

```bash
python manage.py migrate
```

Then I collected static files:

```bash
python manage.py collectstatic --noinput
```

## Running Gunicorn Manually

I tested the backend manually with Gunicorn:

```bash
gunicorn config.wsgi:application --bind 0.0.0.0:8000
```

The backend had to bind with:

```text
0.0.0.0:8000
```

This is important because the web server needs to access the backend through the private network.

From the web server, I tested the backend:

```bash
curl -I http://10.0.3.142:8000
```

The response showed:

```text
HTTP/1.1 200 OK
Server: gunicorn
```

This confirmed that the web server could reach the private app server.

## Creating systemd Service for Gunicorn

To keep the backend running permanently, I created a systemd service.

```bash
sudo nano /etc/systemd/system/wagtail.service
```

Service file:

```ini
[Unit]
Description=Gunicorn service for Wagtail Django backend
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/backend
Environment="PATH=/home/ubuntu/backend/venv/bin"
ExecStart=/home/ubuntu/backend/venv/bin/gunicorn config.wsgi:application --workers 3 --bind 0.0.0.0:8000

Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

Then I enabled and started the service:

```bash
sudo systemctl daemon-reload
sudo systemctl start wagtail
sudo systemctl enable wagtail
```

I checked the service status:

```bash
sudo systemctl status wagtail
```

To view logs:

```bash
sudo journalctl -u wagtail -f
```

At this point, the private app server was successfully running the Wagtail/Django backend with Gunicorn and systemd.

---

# 4. DB Server EC2 Instance - Private

Finally, I created and configured the private DB server EC2 instance. This server stores the MySQL database used by the Django/Wagtail backend.

The DB server is private and does not have a public IP address. It can only be accessed from the app server through the private network. For SSH administration, I accessed it through the public web server using SSH agent forwarding.

## DB Server Details

```text
Database Server Private IP: 10.0.2.36
Database: MySQL
MySQL Version: 8.0.45
Operating System: Ubuntu
Access Type: Private only
```

## DB Server Security Group

The DB server security group allowed only required traffic.

| Type | Port | Source |
|---|---|---|
| SSH | 22 | SG-Web or Admin Jump Access |
| MySQL/Aurora | 3306 | SG-App only |

I did not allow MySQL access from:

```text
0.0.0.0/0
```

because the database should not be public. MySQL traffic was allowed only from the private app server.

## Connecting to the Private DB Server

I connected to the DB server through the public web server using SSH agent forwarding.

From my local machine:

```bash
chmod 400 devops-3tier-key.pem
eval "$(ssh-agent -s)"
ssh-add devops-3tier-key.pem
ssh -A ubuntu@3.8.126.81
```

Then from the web server, I connected to the DB server:

```bash
ssh ubuntu@10.0.2.36
```

At first, SSH access did not work because the DB server security group was not allowing SSH traffic. I fixed this by allowing SSH from the web/app server security group for administration.

## Installing MySQL Server

After the NAT setup allowed the private DB server to access the internet, I installed MySQL:

```bash
sudo apt update
sudo apt install mysql-server -y
```

Then I checked the MySQL version:

```bash
mysql --version
```

The installed version was:

```text
MySQL 8.0.45
```

I checked and enabled the MySQL service:

```bash
sudo systemctl status mysql
sudo systemctl start mysql
sudo systemctl enable mysql
```

## Creating Database and User

I logged into MySQL:

```bash
sudo mysql
```

Then I created the application database:

```sql
CREATE DATABASE portfolio_cms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

I created a database user for the application:

```sql
CREATE USER 'portfolio_user'@'10.0.3.142' IDENTIFIED BY 'YOUR_DB_PASSWORD';
```

Then I granted privileges:

```sql
GRANT ALL PRIVILEGES ON portfolio_cms.* TO 'portfolio_user'@'10.0.3.142';
FLUSH PRIVILEGES;
EXIT;
```

Here, `10.0.3.142` is the private IP address of the app server. This means only the app server can connect using this database user.

## Configuring MySQL for Remote Access

By default, MySQL listens only on localhost. Since the Django app server is separate, I updated the MySQL bind address.

I opened the MySQL configuration file:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

I changed:

```text
bind-address = 127.0.0.1
```

to:

```text
bind-address = 0.0.0.0
```

Then I restarted MySQL:

```bash
sudo systemctl restart mysql
```

Even though MySQL listens on all interfaces, access is still controlled by the AWS security group and MySQL user permission.

## Importing Existing Database

My project had a database backup file named:

```text
portfolio_cms.sql
```

I copied it to the DB server:

```bash
scp portfolio_cms.sql ubuntu@10.0.2.36:/home/ubuntu/portfolio_cms.sql
```

Then I imported it into the database:

```bash
sudo mysql portfolio_cms < /home/ubuntu/portfolio_cms.sql
```

After importing, I checked the tables:

```bash
sudo mysql
```

Inside MySQL:

```sql
USE portfolio_cms;
SHOW TABLES;
EXIT;
```

The tables were displayed successfully, which confirmed that the database import worked.

## Testing Database Connection

From the app server, I tested the database connection:

```bash
mysql -h 10.0.2.36 -u portfolio_user -p portfolio_cms
```

After the connection worked, I also tested the Django backend using:

```bash
python manage.py check
python manage.py migrate
```

This confirmed that the app server could communicate with the private database server.

The database server was successfully configured as a private MySQL server for the backend application.

---

# Final Testing

After completing all server setups, I tested the full application flow.

## Test Frontend

From the web server:

```bash
curl -I http://127.0.0.1:3000
```

This confirmed that the Next.js frontend was running.

## Test Backend from Web Server

```bash
curl -I http://10.0.3.142:8000
```

The response was:

```text
HTTP/1.1 200 OK
Server: gunicorn
```

This confirmed that the web server could reach the private app server.

## Test Public Website

```bash
curl -I http://3.8.126.81
```

The response showed:

```text
HTTP/1.1 200 OK
Server: nginx
```

This confirmed that the public website was working through Nginx.

## Test Wagtail Admin Route

```bash
curl -I http://3.8.126.81/admin/
```

The response showed:

```text
HTTP/1.1 302 Found
Location: /admin/login/?next=/admin/
```

This confirmed that the Wagtail admin route was working through the web server proxy.

---

# Application Access Result

The application was accessible from the browser using the public web server IP:

```text
http://3.8.126.81
```

The frontend loaded successfully through Nginx. Backend routes such as `/api/`, `/admin/`, `/static/`, and `/media/` were forwarded to the private app server at `10.0.3.142:8000`.

---

# Final Architecture Summary

The final architecture of the project was:

```text
Browser / Internet User
        ↓
Public Web Server EC2
Public IP: 3.8.126.81
Runs:
- Nginx
- Next.js frontend
- PM2
        ↓
Private App Server EC2
Private IP: 10.0.3.142
Runs:
- Python 3.10.6
- Django / Wagtail
- Gunicorn
- systemd service
        ↓
Private DB Server EC2
Private IP: 10.0.2.36
Runs:
- MySQL 8.0.45
```

The web server is the only public server. The app server and DB server are private. The web server forwards backend routes to the app server, and the app server connects to the DB server using the private IP address.

---

# Screenshots / Proof of Work

The screenshots below show proof of the VPC setup, EC2 instances, route tables, security groups, running services, and application access result.

| Screenshot | Preview |
|---|---|
| Screenshot 3 | ![Screenshot 3](./screenshots/Screenshot_3.png) |
| Screenshot 4 | ![Screenshot 4](./screenshots/Screenshot_4.png) |
| Screenshot 5 | ![Screenshot 5](./screenshots/Screenshot_5.png) |
| Screenshot 7 | ![Screenshot 7](./screenshots/Screenshot_7.png) |
| Screenshot 8 | ![Screenshot 8](./screenshots/Screenshot_8.png) |
| Screenshot 9 | ![Screenshot 9](./screenshots/Screenshot_9.png) |
| Screenshot 10 | ![Screenshot 10](./screenshots/Screenshot_10.png) |
| Screenshot 11 | ![Screenshot 11](./screenshots/Screenshot_11.png) |
| Screenshot 12 | ![Screenshot 12](./screenshots/Screenshot_12.png) |
| Screenshot 13 | ![Screenshot 13](./screenshots/Screenshot_13.png) |
| Screenshot 14 | ![Screenshot 14](./screenshots/Screenshot_14.png) |
| Screenshot 15 | ![Screenshot 15](./screenshots/Screenshot_15.png) |
| Screenshot 16 | ![Screenshot 16](./screenshots/Screenshot_16.png) |
| Screenshot 17 | ![Screenshot 17](./screenshots/Screenshot_17.png) |
| Screenshot 18 | ![Screenshot 18](./screenshots/Screenshot_18.png) |
| Screenshot 19 | ![Screenshot 19](./screenshots/Screenshot_19.png) |
| Screenshot 20 | ![Screenshot 20](./screenshots/Screenshot_20.png) |
| Screenshot 21 | ![Screenshot 21](./screenshots/Screenshot_21.png) |
| Screenshot 22 | ![Screenshot 22](./screenshots/Screenshot_22.png) |
| Screenshot 23 | ![Screenshot 23](./screenshots/Screenshot_23.png) |
| Screenshot 24 | ![Screenshot 24](./screenshots/Screenshot_24.png) |
| Screenshot 25 | ![Screenshot 25](./screenshots/Screenshot_25.png) |
| Screenshot 26 | ![Screenshot 26](./screenshots/Screenshot_26.png) |
| Screenshot 27 | ![Screenshot 27](./screenshots/Screenshot_27.png) |
| Screenshot 28 | ![Screenshot 28](./screenshots/Screenshot_28.png) |
| Screenshot 29 | ![Screenshot 29](./screenshots/Screenshot_29.png) |
| Screenshot 30 | ![Screenshot 30](./screenshots/Screenshot_30.png) |
| Screenshot 31 | ![Screenshot 31](./screenshots/Screenshot_31.png) |
| Screenshot 32 | ![Screenshot 32](./screenshots/Screenshot_32.png) |
| Screenshot 33 | ![Screenshot 33](./screenshots/Screenshot_33.png) |
| Screenshot 34 | ![Screenshot 34](./screenshots/Screenshot_34.png) |
| Screenshot 35 | ![Screenshot 35](./screenshots/Screenshot_35.png) |
| Screenshot 36 | ![Screenshot 36](./screenshots/Screenshot_36.png) |
| Screenshot 37 | ![Screenshot 37](./screenshots/Screenshot_37.png) |
| Screenshot 38 | ![Screenshot 38](./screenshots/Screenshot_38.png) |
| Screenshot 39 | ![Screenshot 39](./screenshots/Screenshot_39.png) |
| Screenshot 40 | ![Screenshot 40](./screenshots/Screenshot_40.png) |
| Screenshot 41 | ![Screenshot 41](./screenshots/Screenshot_41.png) |

---

# Assignment Requirement Checklist

| Requirement | Status |
|---|---|
| Minimum 3 EC2 instances | Done |
| Web server with Nginx | Done |
| Backend application | Done |
| Database | Done |
| Presentation layer | Done |
| Application layer | Done |
| Data layer | Done |
| Proper separation between layers | Done |
| Git repository link | Done |
| README setup steps | Done |
| README configuration steps | Done |
| Screenshots / proof of work | Done |
| Application access result | Done |

---

# Conclusion

In this assignment, I successfully created a secure 3-tier architecture on AWS using EC2 instances. First, I created a custom VPC with public and private subnets. Then I configured the public web server to run the Next.js frontend using PM2 and Nginx.

After that, I configured the private app server to run the Django/Wagtail backend using Python 3.10.6, Gunicorn, and systemd. Finally, I configured the private DB server with MySQL and connected it securely with the app server.

This architecture keeps the frontend public while protecting the backend and database inside private subnets. It also follows a proper 3-tier deployment structure where each layer has a separate responsibility.

Overall, this assignment satisfies the Module 4 requirements because it uses EC2 instances only for the main application layers, includes Nginx as the web server, includes a backend application, includes a database, and maintains proper separation between the presentation, application, and data layers.
